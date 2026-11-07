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
    // default look, as if it carried the look gene. NL picks the part of a pawn in ControllerBaseComp<T,S>.SetRandomFaceType
    // among the definitions whose targetGeneDefs match the genes of the pawn, else among the untargeted ones: the postfix
    // replaces that pick when no definition of the part targets a gene of the pawn and the Mod options name a default look.
    // Pawns with a look gene, or with any gene another mod targets, are never touched.
    //
    // The patch is applied once, on the shared code of the generic class: the runtime shares that code between every
    // instantiation over a reference type, so a patch per type would run for all types (and write a definition of one type
    // into the part of another). The part type T is read from the comp instance.
    public static class FaceDefaults
    {
        private static FieldInfo settingsField;
        private static FieldInfo drawForGenes;

        public static void Patch(Harmony harmony)
        {
            var faceTypeBase = AccessTools.TypeByName("FacialAnimation.FaceTypeDef");
            var comp = AccessTools.TypeByName("FacialAnimation.EyeballControllerComp");
            var settingsType = AccessTools.TypeByName("FacialAnimation.FacialAnimationMod");
            if (faceTypeBase == null || comp == null || settingsType == null)
            {
                return;
            }
            settingsField = AccessTools.Field(settingsType, "Settings");
            drawForGenes = AccessTools.Field(settingsField.FieldType, "DrawFaceTypeForGenes");
            var baseType = comp.BaseType;
            var target = AccessTools.Method(baseType, "SetRandomFaceType");
            if (target != null)
            {
                harmony.Patch(target, postfix: new HarmonyMethod(typeof(FaceDefaults).GetMethod(nameof(Postfix))));
            }
        }

        public static void Postfix(object __instance)
        {
            try
            {
                Apply(__instance);
            }
            catch (Exception e)
            {
                Log.Error("[Biotech Bodies] face default failed for " + __instance.GetType().Name + ": " + (e is TargetInvocationException && e.InnerException != null ? e.InnerException : e));
            }
        }

        private static void Apply(object __instance)
        {
            if (!ModsConfig.BiotechActive || BiBMod.Settings == null || !GenesDrawn())
            {
                return;
            }
            var pawn = Field(__instance.GetType(), "pawn")?.GetValue(__instance) as Pawn;
            var type = PartType(__instance.GetType());
            if (pawn == null || type == null)
            {
                return;
            }
            var look = BiBMod.Settings.ResolveFace(pawn);
            if (look == null)
            {
                return;
            }
            var found = (IList<Def>)typeof(FaceDefaults).GetMethod(nameof(Matching), BindingFlags.NonPublic | BindingFlags.Static)
                .MakeGenericMethod(type).Invoke(null, new object[] { pawn, look });
            if (found != null && found.Count > 0)
            {
                Field(__instance.GetType(), "faceType").SetValue(__instance, Pick(found));
            }
        }

        // A field of the generic base of a controller comp, taken from the instantiation the comp really has: the
        // FieldInfo of one instantiation does not apply to an instance of another.
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
            return drawForGenes == null || (bool)drawForGenes.GetValue(settingsField.GetValue(null));
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

        // The parts of a pawn follow the default look when the Mod options change: re-pick the parts of a pawn that has
        // a default look now, or that wears a part of one (back to NL's own pick when the default was removed).
        public static void Refresh(Pawn pawn)
        {
            if (settingsField == null || !(pawn is ThingWithComps thing))
            {
                return;
            }
            var wants = BiBMod.Settings != null && BiBMod.Settings.ResolveFace(pawn) != null;
            foreach (var comp in thing.AllComps)
            {
                if (comp.GetType().Namespace != "FacialAnimation" || PartType(comp.GetType()) == null)
                {
                    continue;
                }
                var current = Field(comp.GetType(), "faceType")?.GetValue(comp) as Def;
                if (wants || (current != null && current.defName.StartsWith("BiB_")))
                {
                    try
                    {
                        AccessTools.Method(comp.GetType(), "SetRandomFaceType")?.Invoke(comp, null);
                        comp.GetType().GetMethod("SetDirty")?.Invoke(comp, null);
                    }
                    catch (Exception e)
                    {
                        Log.Error("[Biotech Bodies] face refresh failed for " + comp.GetType().Name + ": " + (e is TargetInvocationException && e.InnerException != null ? e.InnerException : e));
                    }
                }
            }
            pawn.Drawer?.renderer?.SetAllGraphicsDirty();
        }
    }
}
