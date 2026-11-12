using System.Collections.Generic;
using RimWorld;
using UnityEngine;
using Verse;

namespace BiotechBodies
{
    // One body type and the texture path (without _north/_east/_south suffix) a custom body look draws for it.
    public class BodyPathEntry
    {
        public BodyTypeDef bodyType;
        public string path;
    }

    // DefModExtension of a GeneDef from another mod: the carrier is drawn with these body textures, per body type.
    // The body type itself stays the pawn's own (apparel fit, body shape). A body type not listed, a missing
    // texture, a dessicated body, a mutant or a creepjoiner keep the game's graphic.
    public class BodyLookExtension : DefModExtension
    {
        public List<BodyPathEntry> bodyPaths = new List<BodyPathEntry>();

        public string PathFor(BodyTypeDef bodyType)
        {
            for (int i = 0; i < bodyPaths.Count; i++)
            {
                if (bodyPaths[i].bodyType == bodyType)
                {
                    return bodyPaths[i].path;
                }
            }
            return null;
        }

        public override IEnumerable<string> ConfigErrors()
        {
            if (bodyPaths == null || bodyPaths.Count == 0)
            {
                yield return "BiB BodyLookExtension has no bodyPaths";
                yield break;
            }
            for (int i = 0; i < bodyPaths.Count; i++)
            {
                if (bodyPaths[i].bodyType == null || bodyPaths[i].path.NullOrEmpty())
                {
                    yield return "BiB BodyLookExtension bodyPaths entry " + i + " lacks bodyType or path";
                }
            }
        }
    }

    public static class CustomBody
    {
        // The path of the first active gene of the pawn that carries a look for its body type, or null.
        public static string PathFor(Pawn pawn)
        {
            var genes = pawn?.genes?.GenesListForReading;
            var bodyType = pawn?.story?.bodyType;
            if (genes == null || bodyType == null)
            {
                return null;
            }
            for (int i = 0; i < genes.Count; i++)
            {
                if (!genes[i].Active)
                {
                    continue;
                }
                var ext = genes[i].def.GetModExtension<BodyLookExtension>();
                var path = ext?.PathFor(bodyType);
                if (path != null)
                {
                    return path;
                }
            }
            return null;
        }

        // Graphic of the custom look, tinted white, or null when the texture is missing.
        public static Graphic GraphicFor(Pawn pawn, Graphic game)
        {
            var path = PathFor(pawn);
            if (path == null || game.MatSouth == null)
            {
                return null;
            }
            if (ContentFinder<Texture2D>.Get(path + "_south", false) == null)
            {
                return null;
            }
            return GraphicDatabase.Get<Graphic_Multi>(path, game.MatSouth.shader, Vector2.one, Color.white);
        }
    }
}
