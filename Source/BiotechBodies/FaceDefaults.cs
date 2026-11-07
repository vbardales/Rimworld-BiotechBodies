using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using HarmonyLib;
using RimWorld;
using Verse;

namespace BiotechBodies
{
    // The face default (Mod options): a pawn that carries no gene Facial Animation (NL) can use gets the parts of the
    // default look, as if it carried the look gene. NL asks FaceTypeGenerator<T> for the parts whose targetGeneDefs
    // match the genes of the pawn, and falls back to the untargeted parts when there is none: the postfix fills that
    // empty answer. Pawns with a look gene, or with any gene another mod targets, are never touched.
    public static class FaceDefaults
    {
        private static FieldInfo settingsField;
        private static FieldInfo drawForGenes;

        public static void Patch(Harmony harmony)
        {
            var faceTypeBase = AccessTools.TypeByName("FacialAnimation.FaceTypeDef");
            var generator = AccessTools.TypeByName("FacialAnimation.FaceTypeGenerator`1");
            var settingsType = AccessTools.TypeByName("FacialAnimation.FacialAnimationMod");
            if (faceTypeBase == null || generator == null || settingsType == null)
            {
                return;
            }
            settingsField = AccessTools.Field(settingsType, "Settings");
            drawForGenes = AccessTools.Field(settingsField.FieldType, "DrawFaceTypeForGenes");
            var postfix = typeof(FaceDefaults).GetMethod(nameof(Postfix));
            foreach (var type in GenTypes.AllSubclassesNonAbstract(faceTypeBase))
            {
                var target = AccessTools.Method(generator.MakeGenericType(type), "GetFaceTypeDefsForRaceWithGenes");
                if (target != null)
                {
                    harmony.Patch(target, postfix: new HarmonyMethod(postfix.MakeGenericMethod(type)));
                }
                var applicable = AccessTools.Method(generator.MakeGenericType(type), "GetApplicableFaceTypeDefsForRaceConsideringGenes");
                if (applicable != null)
                {
                    harmony.Patch(applicable, postfix: new HarmonyMethod(typeof(FaceDefaults).GetMethod(nameof(LogApplicable)).MakeGenericMethod(type)));
                }
            }
        }

        public static void Postfix<T>(Pawn pawn, ref IEnumerable<T> __result) where T : Def, new()
        {
            if (!ModsConfig.BiotechActive || BiBMod.Settings == null || __result.Any() || !GenesDrawn())
            {
                return;
            }
            var look = BiBMod.Settings.ResolveFace(pawn);
            if (look == null)
            {
                return;
            }
            var found = Matching<T>(pawn, look);
            if (found.Count > 0)
            {
                __result = found;
            }
        }

        // Diagnostic (2026-11-07): what NL offers a pawn that carries a BiB face gene, to find why the swap does not show.
        private static int logged;

        public static void LogApplicable<T>(Pawn pawn, IEnumerable<T> __result) where T : Def
        {
            if (logged > 60 || pawn?.genes == null || !pawn.genes.GenesListForReading.Any(g => g.def.defName.StartsWith("BiB_Face")))
            {
                return;
            }
            logged++;
            var list = __result.ToList();
            Log.Message("[Biotech Bodies] diag " + typeof(T).Name + " for " + pawn.LabelShort + ": " + list.Count + " applicable, first "
                + (list.Count > 0 ? list[0].defName : "-") + ", genes " + string.Join(",", pawn.genes.GenesListForReading.Select(g => g.def.defName)));
        }

        private static bool GenesDrawn()
        {
            return drawForGenes == null || (bool)drawForGenes.GetValue(settingsField.GetValue(null));
        }

        // Same pick as NL: the parts of the race when the look has some, else the parts for every race.
        private static List<T> Matching<T>(Pawn pawn, FaceLook look) where T : Def, new()
        {
            var targets = AccessTools.Field(typeof(T), "targetGeneDefs");
            var race = AccessTools.Field(typeof(T), "raceName");
            var gender = AccessTools.Field(typeof(T), "gender");
            var forLook = DefDatabase<T>.AllDefs
                .Where(d => ((List<string>)targets.GetValue(d)).Contains(look.GeneDefName)
                    && ((Gender)gender.GetValue(d) == pawn.gender || (int)(Gender)gender.GetValue(d) == 0))
                .ToList();
            var ofRace = forLook.Where(d => (string)race.GetValue(d) == pawn.def.defName).ToList();
            return ofRace.Count > 0 ? ofRace : forLook.Where(d => (string)race.GetValue(d) == string.Empty).ToList();
        }

        // NL re-picks the parts of a pawn only when told a gene changed: tell it after the options changed.
        public static void Refresh(Pawn pawn)
        {
            if (settingsField == null || !(pawn is ThingWithComps thing))
            {
                return;
            }
            foreach (var comp in thing.AllComps)
            {
                var method = comp.GetType().GetMethod("SetGeneChanged");
                if (method != null && comp.GetType().Namespace == "FacialAnimation")
                {
                    method.Invoke(comp, null);
                }
            }
        }
    }
}
