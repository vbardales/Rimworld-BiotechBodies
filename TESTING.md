# Biotech Bodies: tests

Revision written: see `git log -1 -- TESTING.md`. Pickle features live in `Tests/Pickle/Mod/Pickle/Features/`, maps in `Tests/Pickle/wsl-deps.<name>.map`. Every run goes through a ticket (`Submit-PickleRun.ps1 -Mod BiotechBodies -DepMap <map> -Filter '<filter>'`), never by hand.

## Behaviours and scenarios (7.a)

Promised behaviour (STATUS.md design, 2026-11-04/06; PUBLICATION.md is written at writeDocs): a pawn shows a look chosen by gene, else by the race default, else the global default, else the game as it is.

| Id | Behaviour | Feature, filter | Map | Expected |
| --- | --- | --- | --- | --- |
| B1 | BiB_VanillaBody keeps the vanilla body under WDI, male, female, Thin, Hulk, child | `03-vanilla-body` `@vanilla-gene` | vanillabody | body path starts `BiB/Vanilla/`, no error |
| B2 | the same pawn without the gene shows the WDI body | `03-vanilla-body` | vanillabody | path does not start `BiB/Vanilla/` |
| B3 | global and race body default give the vanilla body to a pawn with no gene; BiB_WdiBody beats a Vanilla default | `04-body-options` `@body-options` | bodyoptions | path follows the option; gene wins |
| B4 | apparel fits the vanilla body under WDI | `05-vanilla-body-apparel` `@vanilla-apparel` | vanillabody | pictures read by a person (@review), no error |
| B5 | a Gender.None pawn with the gene shows the vanilla body (asked by NSB for Quill) | `11-neutral-body` `@neutral-gene` | vanillabody | path `BiB/Vanilla/...Naked_<type>`, pictures read |
| F1 | BiB_FaceUnagi, BiB_FaceNiceFA, BiB_FaceRetexture, BiB_FaceReel give the face parts of their pack | `06` to `10` `@face-unagi` `@face-nicefa` `@face-retexture` `@face-reel` | unagi, nicefa, retexture, reel | part types Mouth and Head, prefix `BiB_<Key>_` |
| F2 | the face default (global, race) reaches a pawn with no face gene | `07-face-default` `@face-default` | faceunagi | parts of the default pack drawn |
| S1 | the Mod options page exists, opens and closes with no error | `12-settings` `@settings` | settings | page exists, no error |
| S2 | a clean configuration holds the defaults (globalBody Auto, globalFace empty) | `12-settings` | settings | values as written |
| S3 | choices are written to disk and read back as a restart does | `12-settings` | settings | file and memory agree |
| S4 | a stored WDI choice changes nothing when WDI is not loaded | `12-settings` `@nowdi` | settings | body not from `BiB/Wdi/` nor `BiB/Vanilla/` |
| S5 | the BiB_Settings MainButton is listed by RIMMSQOL, hidden by default, not drawn | `13-rimmsqol-shortcut` `@rimmsqol` | avec-rimmsqol | hidden, no choice, no cell |
| S6 | revealed in RIMMSQOL the shortcut is drawn | `13-rimmsqol-shortcut` | avec-rimmsqol | RIMMSQOL shows visible, file records it, the bar draws it |
| S7 | hidden again it leaves the bar; forgetting the choice leaves nothing | `13-rimmsqol-shortcut` | avec-rimmsqol | as written |
| L1 | French texts: no raw key, no clipping, in English and French | rejouer the S1 capture with `-Language French` | settings, avec-rimmsqol | read by a person (playTests, 8.h) |

Written, not played yet (7.d): every Pickle row above. B1 to B3, B4, F1, F2 were played green on earlier builds (tickets 8d8e, 29a6, 0287, 7e93, a659, f795, 3859, b6ab, a198, 7078; evidence in `Tests/Pickle/Evidence/`); the code changed since (shortcut, renamed Keyed keys, LoadFolders), so they are replayed at playTests (8.c). B5 is queued: ticket 20261107-160455-898-fa56.

## Gaps, said plainly

- Not checked on purpose (owner, 2026-11-07): that the revealed shortcut opens the settings. That is RIMMSQOL's functional domain; our side is the def, hidden by default and listable.
- Female Body Variants load order: unproven (STATUS.md, `remaining`).
- Hair and head slots: not in 1.0.0, no test.
- Adding the mod to a save in progress (scenario D): not applicable, always (owner, 2026-11-06, AUDIT.md 8.i).

## Automated tests (7.b, 7.c)

- 7.b: no unit-test project (`Run-UnitTests.ps1`: n/a, no `Tests/*.Tests.csproj`). The logic that has branches (resolution order gene, race, global, Auto; fallback when WDI is absent) is covered in game by B3 and S4; no pure logic is left outside the game.
- 7.c XML and text checks, rerun at each commit of `Mod/`: `Check-ModBasics.ps1 -ModRoot BiotechBodies`, `Check-Translations.ps1 -ModRoot BiotechBodies`, `Check-DefInjected.ps1 -TransMod BiotechBodies/Mod`, `Check-OptionalCompat.ps1 -Mod BiotechBodies`, `Check-FeatureDefs.js` on each feature with its map.
- Local scripts: none.
- Local Pickle steps: none (all steps are NPT's).

## Conditional passes (`@requires`)

| Tag | Where it is staged | Plan |
| --- | --- | --- |
| `nelim.pickletools.colonistrace`, `camerazoom`, `screenshotstudio` | every map above except avec-rimmsqol | in the map |
| `MalteSchulze.RIMMSqol`, `nelim.pickletools.rimmsqol` | `wsl-deps.avec-rimmsqol.map` | S5 to S7 |
| WDI.Realistic.Bodies, tiagocc0.FemaleBodyVariants | vanillabody, bodyoptions, wdifirst | B1 to B5 |
| face packs UNAGI, Nice FA, Retexture, Reel (and Nals.FacialAnimation) | faceunagi, nicefa, retexture, reel | F1, F2 |

## Seed config/incompat-bmmam-bb (2026-11-13)

`Tests/Pickle/config/incompat-bmmam-bb/Mod_3792365853_AppearanceSettings.xml` enables one pool entry of Body Mod Mix and Match, the Male body of Beautiful Bodies (`graphic|mireia.bodies|Male|Male|Things/Pawn/Humanlike/Bodies/Naked_Male`, id built as in BMMaM `BodyPoolRuntime.cs:179`). Without it BMMaM's pools are empty and it changes nothing (`AppearanceSettings.bodyPoolEnabled`). Written by hand from the BMMaM source, not from a game-written file: if the pawn without a gene still draws the standard path, the key is the first suspect.
