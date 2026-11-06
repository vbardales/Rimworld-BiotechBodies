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
            if (raceBody == null)
            {
                raceBody = new Dictionary<string, BodyLook>();
            }
        }
    }

    public class BiBMod : Mod
    {
        public static BiBSettings Settings;
        private Vector2 scroll;

        public BiBMod(ModContentPack content) : base(content)
        {
            Settings = GetSettings<BiBSettings>();
        }

        public override string SettingsCategory()
        {
            return "BiB_ModName".Translate();
        }

        public override void DoSettingsWindowContents(Rect inRect)
        {
            var races = DefDatabase<ThingDef>.AllDefs.Where(d => d.race != null && d.race.Humanlike)
                .OrderBy(d => d.label ?? d.defName).ToList();
            var list = new Listing_Standard();
            var view = new Rect(0f, 0f, inRect.width - 20f, 60f + races.Count * 32f);
            Widgets.BeginScrollView(inRect, ref scroll, view);
            list.Begin(view);
            list.Label("BiB_BodySlot".Translate());
            list.Label("BiB_BodySlotDesc".Translate());
            Row(list, "BiB_Global".Translate(), Settings.globalBody, v => Settings.globalBody = v, false);
            foreach (var race in races)
            {
                Settings.raceBody.TryGetValue(race.defName, out var current);
                var def = race;
                Row(list, (race.LabelCap.ToString()), current, v =>
                {
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
            list.End();
            Widgets.EndScrollView();
        }

        private static void Row(Listing_Standard list, string label, BodyLook current,
            System.Action<BodyLook> set, bool raceRow)
        {
            var rect = list.GetRect(30f);
            Widgets.Label(rect.LeftHalf(), label);
            var button = rect.RightHalf();
            if (Widgets.ButtonText(button, ("BiB_Look_" + current).Translate()))
            {
                var options = new List<FloatMenuOption>();
                foreach (BodyLook look in System.Enum.GetValues(typeof(BodyLook)))
                {
                    if (look == BodyLook.Wdi && !BodySources.WdiLoaded)
                    {
                        continue;
                    }
                    var chosen = look;
                    var text = look == BodyLook.Auto && raceRow ? "BiB_Look_Inherit".Translate()
                        : ("BiB_Look_" + look).Translate();
                    options.Add(new FloatMenuOption(text, () => set(chosen)));
                }
                Find.WindowStack.Add(new FloatMenu(options));
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
                    pawn.Drawer?.renderer?.SetAllGraphicsDirty();
                }
            }
        }
    }
}
