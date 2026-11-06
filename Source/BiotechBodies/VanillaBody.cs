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
        public static GeneDef BiB_WdiBody;

        static BiBGeneDefOf()
        {
            DefOfHelper.EnsureInitializedInCtor(typeof(BiBGeneDefOf));
        }
    }

    // The body of a pawn taken from one named texture source, whatever the load order says.
    //
    // A texture mod such as WDI's Realistic Bodies ships textures only, under the vanilla paths, and wins by load
    // order: ContentFinder asks the running mods from the last one down. So a body cannot be reached by its own
    // path. The graphic of a pawn with a look is built from a path with a prefix of ours (so GraphicDatabase caches
    // it apart from the default one), and ContentFinder is told to resolve that prefix from one source only.
    // No texture is copied.
    public static class BodySources
    {
        public const string VanillaPrefix = "BiB/Vanilla/";
        public const string WdiPrefix = "BiB/Wdi/";
        public const string WdiPackageId = "WDI.Realistic.Bodies";

        private static readonly MethodInfo FindInBundles =
            AccessTools.Method(typeof(ContentFinder<Texture2D>), "TryFindAssetInModBundles", new[] { typeof(string) });

        public static bool WdiLoaded
        {
            get { return WdiPack() != null; }
        }

        public static string PrefixOf(BodyLook look)
        {
            return look == BodyLook.Vanilla ? VanillaPrefix : look == BodyLook.Wdi ? WdiPrefix : null;
        }

        private static ModContentPack WdiPack()
        {
            var mods = LoadedModManager.RunningModsListForReading;
            for (int i = 0; i < mods.Count; i++)
            {
                if (string.Equals(mods[i].PackageIdPlayerFacing, WdiPackageId, System.StringComparison.OrdinalIgnoreCase))
                {
                    return mods[i];
                }
            }
            return null;
        }

        public static bool Wants(Pawn pawn, out BodyLook look)
        {
            look = BodyLook.Auto;
            if (pawn?.story?.bodyType == null || BiBMod.Settings == null)
            {
                return false;
            }
            look = BiBMod.Settings.ResolveBody(pawn);
            return look != BodyLook.Auto;
        }

        // A prefixed path to the texture, or null when the source cannot give it.
        public static string Resolve(string path)
        {
            if (path.StartsWith(VanillaPrefix))
            {
                return FindVanilla(path.Substring(VanillaPrefix.Length)) != null ? path : null;
            }
            if (path.StartsWith(WdiPrefix))
            {
                return FindWdi(path.Substring(WdiPrefix.Length)) != null ? path : null;
            }
            return null;
        }

        public static Texture2D Find(string prefixedPath)
        {
            if (prefixedPath.StartsWith(VanillaPrefix))
            {
                return FindVanilla(prefixedPath.Substring(VanillaPrefix.Length));
            }
            return FindWdi(prefixedPath.Substring(WdiPrefix.Length));
        }

        // Official content first (Core, then each DLC, in load order), then the base resources, then the asset
        // bundles. Non-official mods are never asked, which is the point.
        private static Texture2D FindVanilla(string path)
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

        // Only the pack of WDI's Realistic Bodies is asked.
        private static Texture2D FindWdi(string path)
        {
            var pack = WdiPack();
            if (pack == null)
            {
                return null;
            }
            return pack.GetContentHolder<Texture2D>().contentList.TryGetValue(path, out var texture) ? texture : null;
        }
    }

    // Gives a pawn with a body look the body of that source. Runs after the other postfixes of the method (Female
    // Body Variants among them) through [HarmonyAfter].
    [HarmonyPatch(typeof(PawnRenderNode_Body), nameof(PawnRenderNode_Body.GraphicFor))]
    public static class PawnRenderNode_Body_GraphicFor_Patch
    {
        [HarmonyPostfix]
        [HarmonyAfter("tiagocc0.FemaleBodyVariants")]
        public static void Postfix(ref Graphic __result, Pawn pawn)
        {
            if (__result == null || !BodySources.Wants(pawn, out var look))
            {
                return;
            }
            // Only the plain naked body: the dessicated body, mutants and creepjoiners keep their own path.
            if (pawn.Drawer.renderer.CurRotDrawMode == RotDrawMode.Dessicated || pawn.IsMutant || pawn.IsCreepJoiner)
            {
                return;
            }
            // Vanilla: the path of the body type, as in vanilla (no variant of another mod). WDI: the path the game
            // was going to draw, so the variants of Female Body Variants carry over to WDI's textures.
            var path = look == BodyLook.Vanilla ? pawn.story.bodyType.bodyNakedGraphicPath : __result.path;
            if (path == null)
            {
                return;
            }
            var shader = __result.MatSouth != null ? __result.MatSouth.shader : null;
            if (shader == null)
            {
                return;
            }
            var prefixed = BodySources.PrefixOf(look) + path;
            // WDI look: a body WDI does not ship (a child, a mod body) keeps the game's graphic.
            if (look == BodyLook.Wdi && BodySources.Resolve(prefixed + "_south") == null)
            {
                return;
            }
            __result = GraphicDatabase.Get<Graphic_Multi>(prefixed, shader, Vector2.one, __result.color);
        }
    }

    // Resolves the prefixed paths from their source only. Everything else goes to the game untouched.
    [HarmonyPatch(typeof(ContentFinder<Texture2D>), nameof(ContentFinder<Texture2D>.Get))]
    public static class ContentFinder_Texture2D_Get_Patch
    {
        [HarmonyPrefix]
        public static bool Prefix(string itemPath, ref Texture2D __result)
        {
            if (FaceLooks.IsFacePath(itemPath))
            {
                __result = FaceLooks.Find(itemPath);
                return false;
            }
            if (itemPath == null
                || !(itemPath.StartsWith(BodySources.VanillaPrefix) || itemPath.StartsWith(BodySources.WdiPrefix)))
            {
                return true;
            }
            __result = BodySources.Find(itemPath);
            return false;
        }
    }
}
