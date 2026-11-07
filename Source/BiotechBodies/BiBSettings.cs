using System.Collections.Generic;
using System.Linq;
using RimWorld;
using UnityEngine;
using Verse;

namespace BiotechBodies
{
    // What a slot shows when no gene says otherwise. Auto = the game and the loaded texture mods, untouched.
    public enum BodyLook
    {
        Auto,
        Vanilla,
        Wdi
    }

    // Resolution of the body slot, first match wins: look gene of the pawn, default of the pawn's race (only a race
    // that is loaded has a row), global default, Auto. Auto changes nothing (owner, 2026-11-06).
    public class BiBSettings : ModSettings
    {
        public BodyLook globalBody = BodyLook.Auto;
        public Dictionary<string, BodyLook> raceBody = new Dictionary<string, BodyLook>();
        // Face default: key of a FaceLook, empty = Auto. Applies only to a pawn with no gene Facial Animation can use.
        public string globalFace = "";
        public Dictionary<string, string> raceFace = new Dictionary<string, string>();

        public FaceLook ResolveFace(Pawn pawn)
        {
            if (!raceFace.TryGetValue(pawn.def.defName, out var key) || string.IsNullOrEmpty(key))
            {
                key = globalFace;
            }
            var look = FaceLooks.ByKey(key);
            return look != null && FaceLooks.Loaded(look) ? look : null;
        }

        public BodyLook ResolveBody(Pawn pawn)
        {
            var look = ResolveBodyUnchecked(pawn);
            // A look whose source mod is not loaded changes nothing.
            return look == BodyLook.Wdi && !BodySources.WdiLoaded ? BodyLook.Auto : look;
        }

        private BodyLook ResolveBodyUnchecked(Pawn pawn)
        {
            if (pawn.genes != null)
            {
                if (BiBGeneDefOf.BiB_VanillaBody != null && pawn.genes.HasActiveGene(BiBGeneDefOf.BiB_VanillaBody))
                {
                    return BodyLook.Vanilla;
                }
                if (BiBGeneDefOf.BiB_WdiBody != null && pawn.genes.HasActiveGene(BiBGeneDefOf.BiB_WdiBody))
                {
                    return BodyLook.Wdi;
                }
            }
            if (raceBody.TryGetValue(pawn.def.defName, out var race) && race != BodyLook.Auto)
            {
                return race;
            }
            return globalBody;
        }

        public override void ExposeData()
        {
            Scribe_Values.Look(ref globalBody, "globalBody", BodyLook.Auto);
            Scribe_Collections.Look(ref raceBody, "raceBody", LookMode.Value, LookMode.Value);
            Scribe_Values.Look(ref globalFace, "globalFace", "");
            Scribe_Collections.Look(ref raceFace, "raceFace", LookMode.Value, LookMode.Value);
            if (raceBody == null)
            {
                raceBody = new Dictionary<string, BodyLook>();
            }
            if (raceFace == null)
            {
                raceFace = new Dictionary<string, string>();
            }
            if (globalFace == null)
            {
                globalFace = "";
            }
        }
    }

    public class BiBMod : Mod
    {
        public static BiBSettings Settings;
        public static BiBMod Instance;
        private Vector2 scroll;

        public BiBMod(ModContentPack content) : base(content)
        {
            Instance = this;
            Settings = GetSettings<BiBSettings>();
        }

        public override string SettingsCategory()
        {
            return "BiB_ModName".Translate();
        }

        private static string RaceLabel(ThingDef race, List<ThingDef> races)
        {
            var label = race.LabelCap.ToString();
            return races.Count(r => r.LabelCap.ToString() == label) > 1 ? label + " (" + race.defName + ")" : label;
        }

        public override void DoSettingsWindowContents(Rect inRect)
        {
            var races = DefDatabase<ThingDef>.AllDefs.Where(d => d.category == ThingCategory.Pawn && d.race != null && d.race.Humanlike)
                .OrderBy(d => d.label ?? d.defName).ToList();
            var faces = FaceLooks.All.Where(FaceLooks.Loaded).ToList();
            var list = new Listing_Standard();
            var view = new Rect(0f, 0f, inRect.width - 20f, 160f + (races.Count + 1) * 32f * (faces.Count > 0 ? 2 : 1));
            Widgets.BeginScrollView(inRect, ref scroll, view);
            list.Begin(view);
            list.Label("BiB_BodySlot".Translate());
            list.Label("BiB_BodySlotDesc".Translate());
            var bodyOptions = new List<KeyValuePair<string, string>>();
            foreach (BodyLook look in System.Enum.GetValues(typeof(BodyLook)))
            {
                if (look != BodyLook.Wdi || BodySources.WdiLoaded)
                {
                    bodyOptions.Add(new KeyValuePair<string, string>(look.ToString(), ("BiB_Look." + look).Translate()));
                }
            }
            Row(list, "BiB_Global".Translate(), Settings.globalBody.ToString(), bodyOptions,
                k => Settings.globalBody = ParseBody(k), false);
            foreach (var race in races)
            {
                Settings.raceBody.TryGetValue(race.defName, out var current);
                var def = race;
                Row(list, RaceLabel(race, races), current.ToString(), bodyOptions, k =>
                {
                    var v = ParseBody(k);
                    if (v == BodyLook.Auto)
                    {
                        Settings.raceBody.Remove(def.defName);
                    }
                    else
                    {
                        Settings.raceBody[def.defName] = v;
                    }
                }, true);
            }
            if (faces.Count > 0)
            {
                list.Gap(12f);
                list.Label("BiB_FaceSlot".Translate());
                list.Label("BiB_FaceSlotDesc".Translate());
                var faceOptions = new List<KeyValuePair<string, string>>
                {
                    new KeyValuePair<string, string>("", "BiB_Look.Auto".Translate())
                };
                faceOptions.AddRange(faces.Select(f =>
                    new KeyValuePair<string, string>(f.Key, ("BiB_FaceLook." + f.Key).Translate().ToString())));
                Row(list, "BiB_Global".Translate(), Settings.globalFace, faceOptions,
                    k => Settings.globalFace = k, false);
                foreach (var race in races)
                {
                    Settings.raceFace.TryGetValue(race.defName, out var current);
                    var def = race;
                    Row(list, RaceLabel(race, races), current ?? "", faceOptions, k =>
                    {
                        if (string.IsNullOrEmpty(k))
                        {
                            Settings.raceFace.Remove(def.defName);
                        }
                        else
                        {
                            Settings.raceFace[def.defName] = k;
                        }
                    }, true);
                }
            }
            list.End();
            Widgets.EndScrollView();
        }

        private static BodyLook ParseBody(string key)
        {
            return (BodyLook)System.Enum.Parse(typeof(BodyLook), key);
        }

        private static void Row(Listing_Standard list, string label, string currentKey,
            List<KeyValuePair<string, string>> options, System.Action<string> set, bool raceRow)
        {
            var rect = list.GetRect(30f);
            Widgets.Label(rect.LeftHalf(), label);
            var autoKey = options[0].Key;
            var shown = options.FirstOrDefault(o => o.Key == currentKey);
            var text = raceRow && currentKey == autoKey ? "BiB_Look_Inherit".Translate().ToString()
                : (shown.Value ?? currentKey);
            if (Widgets.ButtonText(rect.RightHalf(), text))
            {
                var menu = new List<FloatMenuOption>();
                foreach (var option in options)
                {
                    var chosen = option.Key;
                    var optionText = raceRow && chosen == autoKey ? "BiB_Look_Inherit".Translate().ToString()
                        : option.Value;
                    menu.Add(new FloatMenuOption(optionText, () => set(chosen)));
                }
                Find.WindowStack.Add(new FloatMenu(menu));
            }
            list.Gap(2f);
        }

        public override void WriteSettings()
        {
            base.WriteSettings();
            if (Current.ProgramState != ProgramState.Playing)
            {
                return;
            }
            PortraitsCache.Clear();
            foreach (var map in Find.Maps)
            {
                foreach (var pawn in map.mapPawns.AllPawnsSpawned)
                {
                    FaceDefaults.Refresh(pawn);
                    pawn.Drawer?.renderer?.SetAllGraphicsDirty();
                }
            }
        }
    }
}
