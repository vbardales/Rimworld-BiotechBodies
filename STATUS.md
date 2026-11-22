---
mod: Biotech Bodies
packageId: nelim.biotechbodies
repo: Rimworld-BiotechBodies
remote: https://github.com/vbardales/Rimworld-BiotechBodies.git
visibility: public
detached: yes
workflow_stage: playTests[1.0.0]
licence: original
licence_at: "2026-11-04: original mod by the owner, no source mod code reused"
upstream_mod_remotes: N/A
settings_audit: passed
localization: complete
translation_en: complete
translation_fr: complete
dependencies: "2026-11-22, revision d8407df (About.xml, OptionalCompat.xml, LoadFolders.xml unchanged since 0ebc264): modDependencies brrainz.harmony and Ludeon.RimWorld.Biotech; incompatibleWith Gulio.BodyModMixAndMatch (BMMaM, test 16 red documented); optional compat (OptionalCompat.xml, kind texture): Andromeda.FacialAnimation 3302079637, Barb.Facetexture 3271240549, Reel.FacialAnims 3118315633, UNAGI.FacialAnimation 3268178647; loadAfter harmony, Ludeon.RimWorld, Ludeon.RimWorld.Biotech, tiagocc0.FemaleBodyVariants, WDI.Realistic.Bodies, Nals.FacialAnimation and the four face packs; DLC: Biotech only"
ecosystem_line: 1.0
workshop: none
workshop_required_items: "n/a, not released yet"
published: no
tested_on: "2026-11-18 pickle f57edd6 (03 04 05 09 11 12 green, 16 red = documented BMMaM incompat)"
code_review_sha: 050c7b50ea2ff43aacc4e30a6832bfe074e5b689
remaining:
  - "Replay 2026-11-22: 4.g done, stage playTests[1.0.0]. Open: 8.a freeze tested sha (GeneDefs_Looks.xml iconPath changed in 0ebc264 after tested_on f57edd6); 8.c replay of 06 07 08 10 13 15 on the current build (ticket f423 green on genes tab only; 8.d 8.f 8.g 8.h 8.i unread after 0ebc264); 8.m code review of the XML value diff 050c7b5..HEAD (not display text), then new code_review_sha; 8.n. Also: sync-nsb-npt (NPT changed 2026-11-21, update Steps read date); shot 6 run c3e9 in Inbox/gallery-v35 passed, score-gallery and 268 px check owed. Gallery work below is kept."
  - "Open 2026-11-19 (journal of everything before in docs/runs/status-remaining-journal-2026-11-19.md; the NSB and Shotlist sections below hold the gallery state). GALLERY: shotlist v24 (feature 14 header, V24 and V24b) is the plan. Candidates stored in Art/Gallery-clean and Art/Gallery: 1, 3 (label BiB_BodyWdi + BiB_FaceUnagi burned), 4, 5; interface shots 7 (genes tab, green f423) and 8 (options window) stored without subtitle. Shots 2 and 6: V25 filed 2026-11-19 as ticket ba74 (tree 2118e7a, map gallery-visualmods, evidence Inbox/gallery-v34); on RUN_DONE: read summary.json, open captures, shrink to 268 px, score-gallery; shot 2 then torso crop 640x360 + labels vanilla body and WDI body + subtitle, shot 6 crop only if water stays in frame; REDO means delete run and recompose. Earlier v32 run (e33f, 0823) was REDO, deleted. Old notes: Shot 2: two near-identical pawns (same afro, shirt, skin), WDI body not visible at this crop; recompose with torso crop 640x360 and labels vanilla body and WDI body, or two clearly different pawns. Shot 6 v28: reeds and lily pads at the left but no readable pond, pawns in a row, Soren with WoodLog and not beside a lamp; recompose. Not verified: 268 px shrink (ffmpeg) of both. Rule (owner 2026-11-19, Audit): the session decides each image alone, candidate kept (Art plus minified green run in Tests/Pickle/Evidence), REDO to Parked with RELEASE.md and a new take; one owner review at the end (12b). Owed when candidates are final: minify the green run folder of each candidate into Evidence, burn subtitles for 2, send all subtitled images in one message."
  - "CODE and AUDIT: Mod/Defs/GeneDefs_Looks.xml iconPath of the four face genes fixed 2026-11-19 to UI/Icons/Genes/Gene_HeadboneHuman (Gene_Head does not exist, Genes tab logged an error, found by shot 7); Mod/ changed after tested_on f57edd6 and code_review_sha 050c7b5 (four XML values, no code): Audit to say whether 8.a and 8.m reopen; translation review stale on that file (regenerate). 8.m code review of 5cb9ad6..HEAD kept by Audit before this change. Replays green 2026-11-18 on f57edd6 (03 04 05 09 11 12), 16 red documented (BMMaM incompatibleWith stays)."
  - "PEERS: shot 7 and the Genes tab are done (PiT steps `I select the colonist named alone`, `the game interface is shown`, tab name ITab_Genes). Kholo fur question from aPMiaPB answered 2026-11-19 (BiB has no fur gene, awaiting their repro). Open design asks, nothing coded before 1.0.0 is out: sex gene and body texture resolver (Docs/SEX-GENDER-DESIGN.md), BiB_Furry for CoKK, body pack lot 1 (BACKLOG.md), fur look slot or VTF is an owner decision (1.1.0 or later). Then: 1.7 pass (tested_1_7), 8.n to writeShotlist then shootGallery, mountPreview redone from Art/Gallery-clean."
updated: 2026-11-22
protocols_read_sha: 15eb1e61fa482b458f9508e69b85d8f7070f2ac4
---

# Biotech Bodies: status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.
Origin: asked by the owner on 2026-11-04 through RhyaethWdiRealisticBodiesPatch (RWDIRB), whose WDI patch (6 PatchOperationReplace, ticket 261c) stays there untouched. The GitHub repository is not created yet.

## Settings audit

Date 2026-11-07, revision 4c3dc53 (files: Source/BiotechBodies/BiBSettings.cs, MainButtonWorker_Settings.cs, Mod/Defs/MainButtonDefs/BiB_Settings.xml); in-game checks played 2026-11-07 to 2026-11-09 on 5cb9ad6, text revised 2026-11-18 (5.g). Result: `passed` on 5cb9ad6 (S1 to S7 green, see Tests below). Changed since 5cb9ad6 (settings side only): gene renames BiB_BodyVanilla and BiB_BodyWdi in BiBSettings.cs (same logic), two face pack labels and one French MainButton description; no option, access route or default changed. Owed: replay of feature 12 (S1, English and French) on the current build with the 8.b replays, `unverified` until then.

Inventory and rationale (5.a, 5.b). Mod options page "Biotech Bodies" holds the defaults the look slots use when a pawn has no look gene (design of 2026-11-04/06):
- Body slot: one global default and one row per loaded humanlike race; values Auto, Vanilla, WDI (WDI only when WDI.Realistic.Bodies is loaded). Use: a colony decides once how every pawn of a race is drawn without adding a gene to each pawn. Auto changes nothing.
- Face slot: one global default and one row per race; values Auto and each face pack that is loaded (UNAGI, Nice FA, Retexture, Reel). Shown only when at least one pack is loaded. A race row set to Auto inherits the global value.
- No option is decorative; no constant exposed. Hair and head slots have no option (not in 1.0.0).
Resolution order, first match wins: look gene of the pawn, race row, global row, Auto.

Access (5.c, 5.d). Primary: Options de mod, Biotech Bodies (`BiBMod.SettingsCategory`, `DoSettingsWindowContents`), no XML edit, no RIMMSQOL needed. Shortcut: MainButtonDef `BiB_Settings`, `buttonVisible` false (hidden by default), worker opens `Dialog_ModSettings(BiBMod.Instance)`, the same dialog and values as the primary entry (same pattern as BillAutopilot). Added today: before, none existed (defect closed in code).

Usage review (5.e). Body and face defaults apply to the pawn drawn at once for the body (graphic read at each draw) and at the next face generation for the face (FaceDefaults prefix on CompRenderNodes); no restart needed for the body, face to confirm in game. Scope: global to the game install (ModSettings), not per save. Dependent rows: a look whose source mod is not loaded is not offered; a stored WDI value with WDI absent falls back to Auto (`ResolveBody`). Restore defaults: set a row back to Auto/"Inherit"; no "reset all" button (not added: two slots, rows are one click each). Scroll view present. Texts go through keys `BiB_*` (English only for now; French at localize).

Tests (5.f), expected and observed:
- Actual effect, body: global and per-race Auto/Vanilla/WDI observed, tickets 29a6 and 0287 (3 passed each); gene overrides option, 8d8e (5 passed).
- Actual effect, face default: tickets f795 and 3859 (4 passed), pack genes b6ab, a198, 7078 (1 passed each) on build ca5d6c9.
- Optional dependencies: WDI absent played S4 green (2026-11-07); face pack absent path analysed in code (fallback to Auto, row hidden), not played (`unverified`, low risk).
- Compile: `dotnet build --no-incremental`, 0 warning, 0 error on f71990c (2026-11-18, DLL sha256 e2a49343 equals the committed one).
- Played green at playTests (tickets 6bce, b7c4, 0f7b, 32c6, replay b51a, 6f81, ea73): first use with clean config S2, persistence S3, shortcut hidden by default and RIMMSQOL integration S5 to S7, English and French S1, page logs read. Input validation: menus only, no free text. Replay of 12 on the current build owed (see above).

## Translation audit

Date 2026-11-07, revision aa532fd. Texts: 14 owned (8 Keyed calls in BiBSettings.cs; 6 gene labels and descriptions as DefInjected, 2 MainButtonDef fields). English: Keyed and Defs, complete. French: written by the session in Mod/Languages/French (Keyed, DefInjected GeneDef and MainButtonDef); wording avoids pawn agreement (no tu, no vous, no pawn noun in the singular: case B epicene, "Le corps garde...", "les colons"). The four face-pack genes (UNAGI, Nice FA, Retexture, Reel) have their French in Mod/Compat/<Pack>/ gated by Mod/LoadFolders.xml (IfModActive), as Check-DefInjected requires for MayRequire defs. Keys built at run time renamed with a dot ("BiB_Look." + look, "BiB_FaceLook." + key) so Check-Translations sees them as used.
Checks: Check-Translations.ps1 PASS (14 texts), Check-DefInjected.ps1 errors 0 (16 load states of 4 optional mods). Not checked: raw keys, fallback text and clipping in game (unverified until playTests). Relecture de Virginie: done 2026-11-07, revision 53c5939, validated without correction (6.g). ChatGPT review of page 1: no correction; Audit run on an empty file earlier: 1 wording applied (BiB_Look_Inherit), 4 rejected.
Relecture de Virginie (second, texts changed 2026-11-17 and 2026-11-18): validated 2026-11-18, revision 99aebe3 (6.g). ChatGPT review-translation rounds 1 to 7 on page 1 of 1, round 7 with 0 applied (page clean); corrections of the rounds: French titles of the pack names (capital A on Visage Animé), Reel description article, CHANGELOG desiccated and WDI Realistic Bodies look, PUBLICATION intro "during"; refused: `[NL]` prefix of the four face descriptions (real Workshop title), review header revision remark (round 7).

## NSB

Rules (owner, 2026-11-05/07): everything in NSB is free (places, colonists, domestic animals); a colonist or domestic animal outside NSB needs an express validation; a change to a colonist's properties needs an express validation quoted with its date (BiB genes on Nelim, Miel, Soren, Ryu, Quill: owner "oui" 2026-11-09, gallery only); every outfit is free; every animal the mod includes must be shown (rule 5: the mod includes none, n/a).

Last sync 2026-11-19 (NSB docs: last commit 2372794 2026-11-18, already read; NPT: none; earlier 2026-11-18, NPT steps and catalogues): nothing changes a place, colonist, animal or look of this mod. NSB maps carry Nals.FacialAnimation and wdi.realistic.bodies but not the four face packs: the gallery map adds them. Neutral colonists (Quill) draw the head offset low in game (NSB Docs/NEUTRES-TETE.md, not BiB code). Cat 2026-11-18: gallery uses Show Me Your Hands (2475965842) and Yayo's Animation Continued (2877292196) when possible; pond is the real Sanctuary water (no lantern, reed or lily pad def).
Places read: 2026-11-13 (SANCTUAIRE-LIEUX.md); cloister cells 2026-11-15
Tribe read: 2026-11-18 (git log; profiles read earlier: HUMAINS-PROFILS, GALERIE-COLONS, LOOKS-VALIDATION, QUILL-PROFIL, MIEL-PROFIL)
Steps read: 2026-11-19 (git log since 2026-11-18: no commit on steps.md or catalogues; last 2026-11-17 ace6816, vanilla face, already known)

| Place | Shots | Cell (SANCTUAIRE-LIEUX) | Changes for the gallery | Last read |
|---|---|---|---|---|
| river-bridge | 1 | (135, 124) root 8.5, validated | decor placed for the shot, removed after | 2026-11-13 |
| hut (tea-room) | 2 | (140, 73) root 5.2, validated | decor placed for the shot, removed after | 2026-11-13 |
| statue-garden | 3 | (155, 99) root 11, validated | decor placed for the shot, removed after | 2026-11-13 |
| cloister | 4 | (178, 128) root 4.5, validated | pawns on row 128 (175..178), StylingStation (178,127), Columns on row 129 (1b767f7); decor removed after | 2026-11-15 |
| flower-garden | 5 | (154, 110) root 10.5, validated | decor placed for the shot, removed after | 2026-11-13 |
| water-garden | 6 | (167, 173) root 14, validated | decor placed for the shot, removed after | 2026-11-13 |

| Colonist | Shots | Outfit per shot | Last read of profile | Exceptions |
|---|---|---|---|---|
| Nelim | 1, 2, 4, 6 | shirt cream and pants (1, 4, 6), tanktop and shorts (2, fitting) | not opened | BiB look genes and Mod options on her (WDI body, UNAGI face): owner "oui" 2026-11-09, BiB session, gallery only |
| Miel | 2, 4, 6 | collar shirt moss green and pants, tanktop and shorts in 2 | not opened | BiB_VanillaBody, BiB_FaceNiceFA: same "oui" 2026-11-09 |
| Soren | 4, 5, 6 | shirt copper and pants | not opened | BiB_FaceRetexture: same "oui" 2026-11-09 |
| Ryu | 3, 4, 6 | shirt blue and pants | not opened | BiB_WdiBody, BiB_FaceReel: same "oui" 2026-11-09 |
| Quill Aster | 3, 6 | collar shirt #556B2F, pants, PAG glasses | 2026-11-09 | BiB_VanillaBody: owner "oui" 2026-11-09 (Gender.None, vanilla look) |

| Animal | Shots | Outfit | Last read | Exceptions |
|---|---|---|---|---|
| Shogun (labrador, NSB) | 1, 6 | none (default collar `Apparel_leatherdogcollar`) | 2026-11-15 | none |

| Included animal (rule 5) | Shots |
|---|---|
| none: the mod includes no animal | n/a |


## Shotlist

Plan: shotlist v24 (header V24 and V24b of `Tests/Pickle/Features/14-gallery.feature`, Opus director pass 2026-11-18); story and per-shot detail live in the feature header and in PUBLICATION.md, not here. Series k ok; plan mean 4.67.

| Shot | Place, time | Subject | State (2026-11-19) |
|---|---|---|---|
| 1-bridge-morning | river-bridge 08:00 | Nelim carries Cloth, Shogun in front | candidate (Art/Gallery-clean and Art/Gallery) |
| 2-two-bodies | hut 09:00 | same Hulk Female body, WDI (front) and vanilla (profile) | candidate: torso crop 640x360 with labels in Art/Gallery-clean (ticket ba74 green, minified in Evidence/gallery-candidates/v34-shot2); subtitle at rate-gallery |
| 3-nelim-turn | cloister 12:00 | Nelim BiB_BodyWdi + BiB_FaceUnagi | candidate, label burned (proof: ticket 4839 with visual mods) |
| 4-faces-at-the-mirror | cloister 13:00 | four face packs | candidate |
| 5-soren-portrait | flower-garden 15:00 | one face pack close up | candidate |
| 6-water-garden-dusk | water-garden 17:00 | friends leave at dusk | V26 filed: ticket c3e9 (647efd3, frame (163.5,173) root size 3, water and reeds on the left third); then score-gallery, 268 px check |
| 7-genes-tab | cloister | Genes tab of Nelim | stored, no subtitle (ticket f423 green after iconPath fix) |
| 8-options-window | window-backdrop | Mod options | stored, no subtitle (ticket 2405) |

Facts to keep: screenshot mode hides the inspect pane (step `the game interface is shown` before the tab step, tab name ITab_Genes); the whole water-garden frame is water around the flagstone island (terrain log 2026-11-18), the pond is only cued by reeds and lily pads; Quack is a grey title suffix of Nelim's label, not a second pawn. Gallery rules (owner, Audit 2026-11-19): the session decides each image alone; candidate = Art/Gallery-clean plus Art/Gallery plus minified green run in Evidence; REDO = files and run deleted, recompose, no Parked. Owed: minify the green run folder of each candidate into Evidence (1 3 4 5 7 8 not checked), burn subtitles for 2 and 6 when candidates, score-gallery on 2 and 6 after recompose, then mountPreview from Art/Gallery-clean.
