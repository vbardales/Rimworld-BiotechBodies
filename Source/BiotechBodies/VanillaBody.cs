using System.Reflection;
using HarmonyLib;
using RimWorld;
using UnityEngine;
using Verse;

namespace BiotechBodies
{
    [DefOf]
    public static class BiBGeneDefOf
    {
        public static GeneDef BiB_VanillaBody;

        static BiBGeneDefOf()
        {
            DefOfHelper.EnsureInitializedInCtor(typeof(BiBGeneDefOf));
        }
    }

    // The vanilla body of a pawn, whatever texture mod loads on top of the vanilla paths.
    //
    // A texture mod such as WDI's Realistic Bodies ships textures only, under the vanilla paths, and wins by load
    // order: ContentFinder asks the running mods from the last one down. So a vanilla body cannot be reached by
    // its own path. The graphic of a pawn with the gene BiB_VanillaBody is built from a path with a prefix of ours
    // (so GraphicDatabase caches it apart from the modded one), and ContentFinder is told to resolve that prefix
    // from the official content only. No texture is copied.
    public static class VanillaBody
    {
        public const string Prefix = "BiB/Vanilla/";

        private static readonly MethodInfo FindInBundles =
            AccessTools.Method(typeof(ContentFinder<Texture2D>), "TryFindAssetInModBundles", new[] { typeof(string) });

        public static bool Wants(Pawn pawn)
        {
            if (pawn?.story?.bodyType == null || BiBMod.Settings == null)
            {
                return false;
            }
            return BiBMod.Settings.ResolveBody(pawn) == BodyLook.Vanilla;
        }

        // Official content first (Core, then each DLC, in load order), then the base resources, then the asset
        // bundles. Non-official mods are never asked, which is the point.
        public static Texture2D Find(string path)
        {
            var mods = LoadedModManager.RunningModsListForReading;
            for (int i = 0; i < mods.Count; i++)
            {
                if (!mods[i].IsOfficialMod)
                {
                    continue;
                }
                var holder = mods[i].GetContentHolder<Texture2D>();
                if (holder.contentList.TryGetValue(path, out var texture) && texture != null)
                {
                    return texture;
                }
            }
            var resource = Resources.Load<Texture2D>(GenFilePaths.ContentPath<Texture2D>() + path);
            if (resource != null)
            {
                return resource;
            }
            return FindInBundles?.Invoke(null, new object[] { path }) as Texture2D;
        }
    }

    // Gives a pawn with the gene the vanilla naked body. Runs after the other postfixes of the method (Female Body
    // Variants among them) only through [HarmonyAfter]; the path comes from the body type, as in vanilla.
    [HarmonyPatch(typeof(PawnRenderNode_Body), nameof(PawnRenderNode_Body.GraphicFor))]
    public static class PawnRenderNode_Body_GraphicFor_Patch
    {
        [HarmonyPostfix]
        [HarmonyAfter("tiagocc0.FemaleBodyVariants")]
        public static void Postfix(ref Graphic __result, Pawn pawn)
        {
            if (__result == null || !VanillaBody.Wants(pawn))
            {
                return;
            }
            // Only the plain naked body: the dessicated body, mutants and creepjoiners keep their own path.
            if (pawn.Drawer.renderer.CurRotDrawMode == RotDrawMode.Dessicated || pawn.IsMutant || pawn.IsCreepJoiner)
            {
                return;
            }
            var nakedPath = pawn.story.bodyType.bodyNakedGraphicPath;
            if (nakedPath == null)
            {
                return;
            }
            var shader = __result.MatSouth != null ? __result.MatSouth.shader : null;
            if (shader == null)
            {
                return;
            }
            __result = GraphicDatabase.Get<Graphic_Multi>(VanillaBody.Prefix + nakedPath, shader, Vector2.one, __result.color);
        }
    }

    // Resolves the prefixed paths from the official content only. Everything else goes to the game untouched.
    [HarmonyPatch(typeof(ContentFinder<Texture2D>), nameof(ContentFinder<Texture2D>.Get))]
    public static class ContentFinder_Texture2D_Get_Patch
    {
        [HarmonyPrefix]
        public static bool Prefix(string itemPath, ref Texture2D __result)
        {
            if (itemPath == null || !itemPath.StartsWith(VanillaBody.Prefix))
            {
                return true;
            }
            __result = VanillaBody.Find(itemPath.Substring(VanillaBody.Prefix.Length));
            return false;
        }
    }
}
