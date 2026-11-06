using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Xml;
using HarmonyLib;
using UnityEngine;
using Verse;

namespace BiotechBodies
{
    // One face look = the face part definitions of one texture pack for Facial Animation (NL), read from the XML of
    // that pack and cloned under new names, so a pawn that carries the look gene gets the parts of that pack, whatever
    // the load order says. NL already picks the parts of a pawn among the definitions whose targetGeneDefs name a gene
    // the pawn carries (setting "draw face types for genes"), and falls back to the definitions with no target for a
    // part the pack does not cover. The originals are never touched: a pawn without the gene is drawn as before.
    //
    // Facial Animation is reached by reflection: it is an optional integration, no reference at build time.
    public class FaceLook
    {
        public string Key;
        public string PackageId;
        public string GeneDefName;

        public string Prefix
        {
            get { return FaceLooks.PrefixRoot + Key + "/"; }
        }
    }

    public static class FaceLooks
    {
        public const string PrefixRoot = "BiB/Face/";
        private const string FaceTypeDefName = "FacialAnimation.FaceTypeDef";

        public static readonly List<FaceLook> All = new List<FaceLook>
        {
            new FaceLook { Key = "Unagi", PackageId = "UNAGI.FacialAnimation", GeneDefName = "BiB_FaceUnagi" },
            new FaceLook { Key = "NiceFA", PackageId = "Andromeda.FacialAnimation", GeneDefName = "BiB_FaceNiceFA" },
            new FaceLook { Key = "Retexture", PackageId = "Barb.Facetexture", GeneDefName = "BiB_FaceRetexture" },
            new FaceLook { Key = "Reel", PackageId = "Reel.FacialAnims", GeneDefName = "BiB_FaceReel" }
        };

        private static readonly Dictionary<string, ModContentPack> packByPrefix = new Dictionary<string, ModContentPack>();

        public static ModContentPack PackOf(string prefixedPath)
        {
            foreach (var pair in packByPrefix)
            {
                if (prefixedPath.StartsWith(pair.Key))
                {
                    return pair.Value;
                }
            }
            return null;
        }

        public static bool IsFacePath(string path)
        {
            return path != null && path.StartsWith(PrefixRoot);
        }

        // The texture of a prefixed path: from the pack of the look, else the game as if no prefix were there.
        public static Texture2D Find(string prefixedPath)
        {
            string rest;
            var pack = PackOf(prefixedPath);
            if (pack == null)
            {
                return null;
            }
            rest = prefixedPath.Substring(prefixedPath.IndexOf('/', PrefixRoot.Length) + 1);
            if (pack.GetContentHolder<Texture2D>().contentList.TryGetValue(rest, out var texture) && texture != null)
            {
                return texture;
            }
            return ContentFinder<Texture2D>.Get(rest, false);
        }

        // Runs once, after the defs are loaded and before Facial Animation builds its per race lists.
        public static void Register()
        {
            var faceTypeBase = GenTypes.GetTypeInAnyAssembly(FaceTypeDefName);
            if (faceTypeBase == null)
            {
                return;
            }
            foreach (var look in All)
            {
                var pack = LoadedModManager.RunningModsListForReading.FirstOrDefault(m =>
                    string.Equals(m.PackageIdPlayerFacing, look.PackageId, StringComparison.OrdinalIgnoreCase));
                if (pack == null || DefDatabase<GeneDef>.GetNamedSilentFail(look.GeneDefName) == null)
                {
                    continue;
                }
                try
                {
                    var count = CloneParts(look, pack, faceTypeBase);
                    packByPrefix[look.Prefix] = pack;
                    Log.Message("[Biotech Bodies] face look " + look.Key + ": " + count + " part definitions cloned.");
                }
                catch (Exception e)
                {
                    Log.Warning("[Biotech Bodies] face look " + look.Key + " skipped: " + e);
                }
            }
        }

        public static bool Loaded(FaceLook look)
        {
            return packByPrefix.ContainsKey(look.Prefix);
        }

        private static int CloneParts(FaceLook look, ModContentPack pack, Type faceTypeBase)
        {
            var assets = DirectXmlLoader.XmlAssetsInModFolder(pack, "Defs/", null);
            var parents = new Dictionary<string, XmlNode>();
            var nodes = new List<XmlNode>();
            foreach (var asset in assets)
            {
                if (asset.xmlDoc?.DocumentElement == null)
                {
                    continue;
                }
                foreach (XmlNode node in asset.xmlDoc.DocumentElement.ChildNodes)
                {
                    if (node.NodeType != XmlNodeType.Element)
                    {
                        continue;
                    }
                    var name = node.Attributes?["Name"]?.Value;
                    if (name != null)
                    {
                        parents[name] = node;
                    }
                    nodes.Add(node);
                }
            }
            var created = 0;
            foreach (var node in nodes)
            {
                var type = GenTypes.GetTypeInAnyAssembly(node.Name);
                if (type == null || !faceTypeBase.IsAssignableFrom(type) || node.Attributes?["Abstract"]?.Value == "True")
                {
                    continue;
                }
                var resolved = Resolve(node, parents);
                var def = ObjectFromXml(type, resolved);
                if (def == null || string.IsNullOrEmpty(def.defName))
                {
                    continue;
                }
                def.defName = "BiB_" + look.Key + "_" + def.defName;
                Prefix(def, faceTypeBase, "texPath", look);
                Prefix(def, faceTypeBase, "altMaskPath", look);
                Prefix(def, faceTypeBase, "optTexPath", look);
                var targets = (List<string>)AccessTools.Field(faceTypeBase, "targetGeneDefs").GetValue(def);
                targets.Clear();
                targets.Add(look.GeneDefName);
                def.modContentPack = pack;
                AccessTools.Method(typeof(DefDatabase<>).MakeGenericType(type), "Add", new[] { type })
                    .Invoke(null, new object[] { def });
                created++;
            }
            return created;
        }

        // The XML inheritance of a def is flat in these packs: the children of the parent not set by the def itself.
        private static XmlNode Resolve(XmlNode node, Dictionary<string, XmlNode> parents)
        {
            var parentName = node.Attributes?["ParentName"]?.Value;
            if (parentName == null || !parents.TryGetValue(parentName, out var parent))
            {
                return node;
            }
            var merged = node.CloneNode(true);
            foreach (XmlNode child in Resolve(parent, parents).ChildNodes)
            {
                if (child.NodeType == XmlNodeType.Element && merged[child.Name] == null)
                {
                    merged.AppendChild(merged.OwnerDocument.ImportNode(child, true));
                }
            }
            return merged;
        }

        private static Def ObjectFromXml(Type type, XmlNode node)
        {
            var method = AccessTools.Method(typeof(DirectXmlToObject), "ObjectFromXml").MakeGenericMethod(type);
            return method.Invoke(null, new object[] { node, false }) as Def;
        }

        private static void Prefix(Def def, Type faceTypeBase, string field, FaceLook look)
        {
            var info = AccessTools.Field(faceTypeBase, field);
            var value = info.GetValue(def) as string;
            if (!string.IsNullOrEmpty(value))
            {
                info.SetValue(def, look.Prefix + value);
            }
        }
    }
}
