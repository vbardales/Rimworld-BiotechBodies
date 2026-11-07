using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using HarmonyLib;
using RimWorld;
using Verse;

namespace BiotechBodies
{
    // The face default (Mod options): a pawn that carries no gene Facial Animation (NL) can use gets the parts of the
    // default look, as if it carried the look gene. NL picks the part of a pawn among the definitions whose targetGeneDefs
    // match the genes of the pawn, else among the untargeted ones; this sets the part to a definition of the default look
    // when no definition of that part targets a gene of the pawn. Pawns with a look gene, or with any gene another mod
    // targets, are never touched.
    //
    // NL code is never patched: the controller comps are generic classes whose code the runtime shares between all part
    // types, and a Harmony patch there loses the part type (every part would pick definitions of the first type).
    // The hook is the non-generic DrawFaceGraphicsComp.CompRenderNodes, which NL calls when it builds the face nodes of
    // a pawn, before it reads the part of each controller. The part type T is read from each controller comp.
    public static class FaceDefaults
    {
        private static FieldInfo settingsField;
        private static FieldInfo drawForGenes;

        public static void Patch(Harmony harmony)
        {
            var drawComp = AccessTools.TypeByName("FacialAnimation.DrawFaceGraphicsComp");
            var settingsType = AccessTools.TypeByName("FacialAnimation.FacialAnimationMod");
            if (drawComp == null || settingsType == null)
            {
                return;
            }
            settingsField = AccessTools.Field(settingsType, "Settings");
            if (settingsField == null)
            {
                return;
            }
            drawForGenes = AccessTools.Field(settingsField.FieldType, "DrawFaceTypeForGenes");
            var target = AccessTools.Method(drawComp, "CompRenderNodes");
            if (target != null)
            {
                harmony.Patch(target, prefix: new HarmonyMethod(typeof(FaceDefaults).GetMethod(nameof(Prefix))));
            }
        }

        public static void Prefix(ThingComp __instance)
        {
            try
            {
                if (__instance.parent is Pawn pawn)
                {
                    Apply(pawn);
                }
            }
            catch (Exception e)
            {
                var text = "[Biotech Bodies] face default failed: " + (e is TargetInvocationException && e.InnerException != null ? e.InnerException : e);
                Log.ErrorOnce(text, text.GetHashCode());
            }
        }

        // Sets the part of every controller comp of the pawn to a definition of the default look, when it has one.
        private static void Apply(Pawn pawn)
        {
            if (settingsField == null || !ModsConfig.BiotechActive || BiBMod.Settings == null || !GenesDrawn())
            {
                return;
            }
            var look = BiBMod.Settings.ResolveFace(pawn);
            if (look == null)
            {
                return;
            }
            foreach (var comp in Controllers(pawn))
            {
                var type = PartType(comp.GetType());
                comp.GetType().GetMethod("InitializeIfNeed")?.Invoke(comp, null);
                var found = (IList<Def>)typeof(FaceDefaults).GetMethod(nameof(Matching), BindingFlags.NonPublic | BindingFlags.Static)
                    .MakeGenericMethod(type).Invoke(null, new object[] { pawn, look });
                if (found == null || found.Count == 0)
                {
                    continue;
                }
                var faceType = Field(comp.GetType(), "faceType");
                if (!found.Contains((Def)faceType.GetValue(comp)))
                {
                    faceType.SetValue(comp, Pick(found));
                    // NL re-picks among the untargeted definitions when the genes change and the part is not one of them.
                    Field(comp.GetType(), "geneChanged")?.SetValue(comp, false);
                }
            }
        }

        private static IEnumerable<ThingComp> Controllers(Pawn pawn)
        {
            return pawn.AllComps.Where(c => c.GetType().Namespace == "FacialAnimation" && PartType(c.GetType()) != null);
        }

        // A field of the generic base of a controller comp, taken from the instantiation the comp really has.
        private static FieldInfo Field(Type comp, string name)
        {
            for (var t = comp; t != null; t = t.BaseType)
            {
                if (t.IsGenericType && t.GetGenericArguments().Length == 2)
                {
                    var field = t.GetField(name, BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.DeclaredOnly);
                    if (field != null)
                    {
                        return field;
                    }
                }
            }
            return null;
        }

        // The part definition type of a controller comp: the first type argument of its generic base.
        private static Type PartType(Type comp)
        {
            for (var t = comp; t != null; t = t.BaseType)
            {
                if (t.IsGenericType && t.GetGenericArguments().Length == 2 && t.GetField("faceType", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.DeclaredOnly) != null)
                {
                    return t.GetGenericArguments()[0];
                }
            }
            return null;
        }

        private static bool GenesDrawn()
        {
            if (drawForGenes == null)
            {
                return true;
            }
            var settings = settingsField.GetValue(null);
            return settings != null && (bool)drawForGenes.GetValue(settings);
        }

        // Same weighted pick as NL (probability field), among the definitions found.
        private static Def Pick(IList<Def> found)
        {
            var probability = AccessTools.Field(found[0].GetType(), "probability");
            var total = found.Sum(d => (float)probability.GetValue(d));
            var roll = Rand.Range(0f, 1f) * total;
            foreach (var def in found)
            {
                var p = (float)probability.GetValue(def);
                if (roll < p)
                {
                    return def;
                }
                roll -= p;
            }
            return found[found.Count - 1];
        }

        // Nothing when a definition of this part targets a gene the pawn carries (NL picks it); else the parts of the
        // look: the parts of the race when the look has some, else the parts for every race (as NL does).
        private static IList<Def> Matching<T>(Pawn pawn, FaceLook look) where T : Def
        {
            var targets = AccessTools.Field(typeof(T), "targetGeneDefs");
            var race = AccessTools.Field(typeof(T), "raceName");
            var gender = AccessTools.Field(typeof(T), "gender");
            var carried = pawn.genes == null ? new HashSet<string>() : new HashSet<string>(pawn.genes.GenesListForReading.Select(g => g.def.defName));
            var all = DefDatabase<T>.AllDefs.ToList();
            if (all.Any(d => ((List<string>)targets.GetValue(d)).Any(carried.Contains)))
            {
                return null;
            }
            var forLook = all
                .Where(d => ((List<string>)targets.GetValue(d)).Contains(look.GeneDefName)
                    && ((Gender)gender.GetValue(d) == pawn.gender || (int)(Gender)gender.GetValue(d) == 0))
                .ToList();
            var ofRace = forLook.Where(d => (string)race.GetValue(d) == pawn.def.defName).ToList();
            return (ofRace.Count > 0 ? ofRace : forLook.Where(d => (string)race.GetValue(d) == string.Empty).ToList()).Cast<Def>().ToList();
        }

        // The parts of a pawn follow the default look when the Mod options change: apply it to a pawn that has a
        // default look now, or give back the own pick of NL to a pawn that wears a part of a look that is no longer its default.
        public static void Refresh(Pawn pawn)
        {
            if (settingsField == null || !(pawn is ThingWithComps))
            {
                return;
            }
            var wants = BiBMod.Settings != null && BiBMod.Settings.ResolveFace(pawn) != null;
            foreach (var comp in Controllers(pawn))
            {
                // A comp not initialised yet (pawn unset) is left to NL: Apply runs before it first draws.
                if (Field(comp.GetType(), "pawn")?.GetValue(comp) == null)
                {
                    continue;
                }
                var current = Field(comp.GetType(), "faceType")?.GetValue(comp) as Def;
                if (!wants && current != null && current.defName.StartsWith("BiB_"))
                {
                    try
                    {
                        AccessTools.Method(comp.GetType(), "SetRandomFaceType")?.Invoke(comp, null);
                    }
                    catch (Exception e)
                    {
                        Log.Error("[Biotech Bodies] face refresh failed for " + comp.GetType().Name + ": " + (e is TargetInvocationException && e.InnerException != null ? e.InnerException : e));
                    }
                }
            }
            if (wants)
            {
                Apply(pawn);
            }
            foreach (var comp in Controllers(pawn))
            {
                comp.GetType().GetMethod("SetDirty")?.Invoke(comp, null);
            }
            pawn.Drawer?.renderer?.SetAllGraphicsDirty();
        }
    }
}
