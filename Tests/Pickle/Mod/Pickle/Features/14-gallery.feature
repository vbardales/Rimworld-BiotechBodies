@gallery @review @timeout:900 @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.clearscreen @requires:nelim.pickletools.screenshotmode @requires:UNAGI.FacialAnimation @requires:Andromeda.FacialAnimation @requires:Barb.Facetexture @requires:Reel.FacialAnims @requires:WDI.Realistic.Bodies
Feature: the Steam gallery of Biotech Bodies, one day of looks at the Sanctuary

  # V24 (2026-11-18, director pass by an Opus sub-agent, one call, written at writeShotlist; plan only, nothing replayed; it wins over v23 and older). KEPT: (1) new shot 3-nelim-turn (slot 3 was free), cloister at the StylingStation mirror, 12:00 +60 min, Nelim alone with Shogun beside her facing South: she takes BOTH a body gene and a face gene (ask b, combinations): BiB_BodyWdi + BiB_FaceUnagi (the same face as Nelim in shot 4, continuity; not Reel, which draws a frown; the director proposed Nice FA, rejected for continuity), facing East toward the mirror, "stands next to" the StylingStation placed at (178,127), just after she chose; one burned label "BiB_BodyWdi + BiB_FaceUnagi"; native crop 960x540 or tighter, no upscale; the pack draws the mouth, no smile step (criterion d: written reason); decor requested from Cat (salon dressing, family 3). (2) new interface shot 7-genes-tab (ask c): Nelim selected, hidden Genes inspect tab open (nelim.pickletools.inspecttabs in the map), same place and tick as 3, cropped, no subtitle, outside the story score; the tab step has never been played: ticket on one pawn first, if the step fails shot 3 carries ask b alone. (3) shot 6 recomposed (V24): hour 18:00 (at 17:00 the light is still day), Soren in profile facing East carries a WoodLog, the fuel of the TorchLamp he is about to refuel (neutral mouth reads as concentration, no smile asked; no ThingDef Torch exists, no step lays a floor either: stepping stones dropped, the pond ground stays as the map has it, ask NPT for a floor step later), one friend (Miel) faces North, back to the camera, walking off toward the bridge (cast of shot 6 stays Nelim, Miel, Soren, Shogun: Ryu and Quill are not in it) (backs hide the pack mouths, the WDI body still reads from behind), Nelim faces West in profile watching them go, Shogun stands facing South (no lying pose exists, drop "lying"), pond fills about 40% of the frame (stones, reeds, lily pads, flagstone or grass ground, never bare grey, Cat requests: water-garden dressing, light sources), two or three lit lamps in the frame; Quill dropped from shot 6 (head offset, NSB). Check the capture at 268 px before the crop: raise the lamp count before cropping tighter. (4) Steam text and subtitles state ask (e): genes pick a look per pawn, the face genes need their pack installed, the Mod options set the default for a pawn with no gene (to write in PUBLICATION.md at writeReleaseDocs). (5) visual mods rule of 2026-11-18: Show Me Your Hands and Yayo's Animations (and similar) installed for the captures when possible: Cat asked (kind visualmod, compatibility with WDI, the four packs, Nal and BiB); if one cannot share the map the shotlist says why; stored candidates 1 2 4 5 are not reshot for it (the mods change poses and hands, not the body or face looks the mod shows) unless the compatibility check says a pose is wrong. (6) interface window renumbered 8-options-window (was 7), last, native crop with the per-race row in view, no subtitle. REJECTED: renumbering or re-timing the stored candidates 1 2 4 5 (it forces reshoots for no gain); breaking the four-pawn row of shot 4 into a queue with mixed facings (shot 4 is a candidate, v23 variety rule applies when it is recomposed); a global move of the story end to 18:30 (only shot 6 moves, to 18:00). Series rhythm: 08:00 1, 09:00 2, 12:00 3, 13:00 4, 15:00 5, 18:00 6, interface 7 and 8 last. Cat requests sent 2026-11-18 (water-garden dressing, light sources, salon dressing, visualmod); answers owed.
  # V24b (2026-11-18, Cat answers, source: XML of the Sanctuary map; no photo of these yet, PiT asked by Cat, set bib-water-garden). Shot 6 pond dressing, real defNames: no reed and no lily pad def exists (dropped from V24), use Plant_Daylily (Core, already used), PlantPot_Bonsai and Plant_TreeBonsai (Ideology), ground FlagstoneGranite laid as stepping stones and edging (floor step on WaterShallow to confirm with PiT, else on grass beside the pond), Marsh (Core) at the pond edge, GrasslandSoil (Odyssey) grass look; lights Brazier (Royalty, fuel) and TorchLamp (Core, fuel), Campfire (Core, wood) optional, no StandingLamp (power). Shot 3 salon dressing: Dresser (closest to a wardrobe, no wardrobe or clothes rack def exists), Armchair, Stool, EndTable, Bookcase (Core), PlantPot_Bonsai (Ideology), StylingStation (Ideology); rug only as Carpet_MindbendA..E floor patch (Ideology). Visual mods: Show Me Your Hands 2475965842 and Yayo's Animation Continued 2877292196 are not in the Sanctuary map: add the two ids to wsl-deps.gallery.map; load order and incompatibilities with WDI, the four FA packs, Nal and the BiB Harmony patch are unknown, so one test ticket (shot 3, with the mods, label gallery visual mods test) runs first; a crash, frozen pose or face clash is written here with its ticket id and Cat is told. Credit sources for the thank-you register: the mods above (workshopIds).
  # SHOTLIST (v4, 2026-11-15, after the first full run f03a: 6 of 6 green, 6 of 6 captures REDO, then an Opus director pass; plan only, nothing replayed yet).
  # V4 CHANGES (they win over the v3 lines below): framing tightened (root size 2 is the floor): 1 at 3.5 on (136,124), 2 at 2, 3 at 2.5, 4 at 2.5 on (176.5,128), 5 head at 2, 6 at 3.5. No carried item on 2 and 4 (the item square hid the body and the faces); 3 puts the Cloth down at its feet. 4: one row, (175..178,128), station at (178,127); row 129 has Columns (SANCTUARY-CASES cloister). 5 moves to statue-garden (plain soil behind the head, flowers only in the foreground). 6: Nelim, Soren, Quill and Shogun only (five pawns do not read at 268 px), no carried lantern. Same mirror in 2, 4, 6; framing tightens from 2 to 5; clothes never change.
  # V8 (2026-11-16, after run aef8 and ticket 2abd; shot 5 only, shots 1 2 4 6 are candidates, shot 3 stays dropped): shot 5 recomposed. Cause of the REDO: Soren faces South, the flowers stood at z 97 and 98 below the chest, outside the head frame; the coil-like statue stood right of him. Now Plant_Daylily at (153,98) and (154,98) (in front of him, row just below the chest), Plant_YellowTallGrass (152,98) kept, Plant_Daylily (153,97) kept for depth; native crop 960x540 at x 400, y 330 of the 1920x1080 capture (head left of centre and in the upper third, flowers in the lower third, the statue on his right falls outside the crop). Shot 2 stored 2026-11-16 as candidate (crop x 480 y 230, Art/Gallery-clean/2-two-bodies.jpg). Hour, light, outfit, Soren and the face pack do not change.
  # V7 (2026-11-16, after run 18ee): shot 3 DROPPED (Quill with the neutral body stays in shot 6; the cropped profile of Quill and the body were unreadable at 268 px), names 1 2 4 5 6 kept, reindex after acceptance. Shot 2 gets Plant_Daylily (141,75) (142,75) and a lit TorchLamp (139,73) inside the crop (the capture had a bare wood floor). Shot 5: Soren moves to (153,99) so the coil-like statue leaves the crop.
  # V10 (2026-11-17, after v9): the green ghost top left and the coil statue are fixtures of the statue-garden, not decor. Shot 5 moves to the flower-garden, Soren at (154,109) facing South (cell proven standable by f03a), no placed decor (the garden own flowers are the foreground), crop 960x540 chosen after the run. The pack draws the mouth (no smile step, by design).
  # V6 (2026-11-16, after runs 80d1 and 6b23): shot 3 moves to the cloister (cells (176,128) (177,128) proven by shot 4), renamed 3-quill-and-ryu, decor Brazier (177,127), TorchLamp (175,126), Plant_Daylily (175,127) (178,127); shot 2 Miel faces South again; shot 5 grass moved to (152,98) (155,97 holds a SculptureSmall); shot 6 Soren carries a WoodLog (no ThingDef named Torch, Torch is a building). Shot 4 passed (6b23): crop 960x540 offset x 450 gives four readable faces at 268 px, Ryu Reel face frowns (the pack draws the mouth).
  # V19 (2026-11-17, owner: "le même personnage, cloné, un avec le gène vanilla et un avec le gène WDI ... l'idéal c'est une femme Fat ou Hulk ou Thin", after the Male tests v15 to v18 read the same at 268 px): exploration scenarios 2f-miel-Fat, -Hulk, -Thin: Miel (NSB, canon face Nice FA, side braid, BiB_BodyWdi) and her twin Mira (same genes and look, BiB_BodyVanilla), both Female, same body type, same tanktop dye, only the gene differs. OWNER VALIDATION (rule 3 of sync-nsb-npt): a clone of Miel, "le même personnage, cloné", pawn outside NSB, 2026-11-17, gallery only. The winner replaces shot 2, the other two 2f-* are deleted. Ticket filed after this commit.
  # V18 (2026-11-17, after ticket 6ead: Thin, Fat and Hulk with the same body type for both pawns; Female failed, a Male pawn cannot take body type Female without gender Female, not retried): Hulk reads the most different at 268 px (WDI tapered waist against vanilla squared sleeves), Fat nearly identical, Thin slight. Shot 2 now Hulk for both pawns; the tanktop colours were random and differed (grey against dark), so both are dyed rgb (230, 224, 206) so only the gene changes. 2t-* scenarios deleted. Subtitle to review: Two bodies, two looks: WDI and vanilla (it is one body type, say so).
  # V17 (2026-11-17, owner on the v15 capture: the two pawns must use the SAME body type, only the gene changes, everything else equal; they win over v15). Shot 2 goes back to Male for both pawns (Soren BiB_BodyWdi, Haru BiB_BodyVanilla). Exploration scenarios 2t-bodytype-Female, -Thin, -Fat, -Hulk (same body type for both, only the gene differs) to find the body type where WDI and vanilla read most different at 268 px; the winner replaces shot 2, the other three are deleted. Ticket 6ead.
  # V16 (2026-11-17, score-gallery at 268 px on the v16 captures of ticket 3862): 6 is a candidate (native crop 1100x619 x 290 y 250, faces about 36 px at 268 px). 1 crop tight 1080x608 shows faces but the decor falls out (bare planks, only torches): decor moved closer to the pawns, Brazier (136, 125), Plant_Daylily (134, 125) (the one at (138, 126) is unchanged and falls outside the crop), then native crop about 1190x670 x 360 y 330 chosen after the run. Nothing else changes.
  # V15 (2026-11-17, owner "Deux corps différents", after ticket 8420 REDO: Soren WDI and Haru vanilla read the same width at 268 px, only the tanktop colour differed; they win over v14). CHANGE: Haru body type is Thin (vanilla look, BiB_BodyVanilla), Soren stays Male with BiB_BodyWdi, so the two silhouettes differ (the 2abd capture of 2026-11-16 already read round vs slim at 268 px). Everything else of v14 is unchanged (twins by genes, face Retexture, hair, tanktop and shorts, cells, hour, frame). The pair now shows two different bodies, not one body type with two looks. Subtitle: "Two bodies, two looks: WDI and vanilla."
  # V14 (2026-11-17, owner idea, they win over v13 and older): shot 2 recomposed. CAUSE: under the tanktop the WDI (Nelim) and vanilla (Miel) bodies read the same at 268 px (hypothesis, not checked: Venus Touch Waistlines reshapes every pawn, to settle with VTW: do not apply its changes to pawns with a non WDI body gene). CHANGE: the pair is now Soren (BiB_BodyWdi) and his twin Haru (same genes, face Retexture, hair and clothes as Soren, but BiB_BodyVanilla), both Male body, both in UnderWhere_Tanktop and LTS_Shorts (the fitting), at (140, 74) and (141, 74) facing South; Nelim and Miel leave the shot (Nelim stays the photographer out of frame). OWNER VALIDATION (rule 3 of sync-nsb-npt): "un jumeau de Soren MAIS en vanilla", pawn outside NSB, 2026-11-17, gallery only. Decor, hour 9, frame (140.5, 74) at root size 2 do not change. Subtitle: "Same body type, two looks: WDI and vanilla."
  # V13 (2026-11-17, score-gallery verdict on the v12 captures of ticket 9e16: 4 and 6 candidates (native crops 1440x810 x 400 y 40 and 1200x675 x 300 y 60, stored in Art/Gallery-clean), 1 and 2 REDO; they win over v12 and older). 1: decor too thin in the frame (Brazier cut at the top, bare planks), frame centre moves from (135, 124) to (135, 125) so the lit Brazier at (136, 126), the Daylilies at (134, 126) and (138, 126) and both TorchLamps are inside the crop (native 1200x675 x 360 y 0 chosen after the run); nothing else changes. 2 STAYS REDO, not refiled yet: WDI and vanilla bodies read the same under the tanktop at 268 px (silhouettes alike), the scene needs another way to show the body difference.
  # V12 (2026-11-17, score-gallery verdict on the v11 captures of ticket f1db: 1 2 4 6 REDO again; they win over v11 and older). CAUSES: 1 and 6 j weak (faces about 10 to 12 px at 268 px: the crop 960x540 is too wide for one to three small pawns); 2 the plan says "same Female body" but Miel was Thin (adequacy partly) and Miel showed no smile; 4 the plan said all smiling but the face packs draw the mouth (Miel stern), plan and picture disagreed; 6 bare grey stone ground, the StylingStation, Brazier and lilies outside the crop. CHANGES: capture at the game floor (root size 2 for 1, 2, 4 and 6, was 2.5), then native crop WITHOUT upscale chosen after the run, tighter than v11: 1 native crop 640x360 centred on Nelim and Shogun (Nelim about 40 px wide at 268 px), 2 native crop 640x360 centred on (140.5, 74), 4 native crop 800x450 centred on the four heads, 6 native crop 640x360 centred on (166, 173). 2: Miel body type is Female (same body type as Nelim, only the look differs, as the subtitle says). 4: written trait, no smile planned and no malus: the face packs draw the mouth and brows (Miel Nice FA, Soren Retexture, Ryu Reel, Nelim Unagi), the picture proves four different faces; Nelim face is the pack face, so her own-face step is not used. 6 decor, all inside the crop: Plant_Daylily at (164, 174) (166, 174) (168, 174), Brazier moved to (169, 174), TorchLamps (164, 172) (170, 172) kept, so the ground is no longer bare; the StylingStation at (172, 174) stays out of the crop (story line in the subtitle only). Hours, outfits, pawns, gestures and the pack genes do not change.
  # V11 (2026-11-17, score-gallery verdict on the v10 captures: 5 candidate, 1 2 4 6 REDO; they win over v10 and older). CAUSES: 1 and 6 were captured at root size 3.5 (faces about 12 px at 268 px, j weak); 2 was bare (the decor of rows 73 and 75 fell outside the 960x540 crop); 4 shows a stern Reel face on Ryu while the plan said smiling. CHANGES: 1 and 6 now at root size 2.5 then native crop 960x540 at x 480 y 270 (centre of the frame), opening and closing become medium shots (series k: no wide shot left, the j rule of 2026-11-09 wins over variety, -0.5 assumed). 1: Nelim faces South (the hut is gone since v5, nothing to look at East), carries the Cloth, Shogun stands at her side facing South, frame centre (136, 125) so the lit Brazier (136, 126) and both TorchLamps are in the crop. 6: hour 17 as the header says (18 gave a grey light), Shogun STANDS at (164, 173) facing South (lying he read as a rug), root size 2.5, crop 960x540 at x 480 y 270 on three pawns and the dog. 2: Plant_Daylily added at (139, 74) and (142, 74) on the row of the pawns so the crop (x 480 y 230) holds flowers beside them. 4: no scenario change; written trait, no malus: Ryu Reel face is stern by design of the pack (the pack draws the mouth), Soren and Miel neutral, no cups, no wall lanterns in the crop (TorchLamps at (175,126) and (181,126) are outside it), the shot proves four different faces. Plan not rerated by score-gallery (it rates the captures, see STATUS).
  # V5 CHANGES (2026-11-16, after the v4 verdict: six REDO; they win over v4 and v3). CROP: shots 2 to 5 are captured at the game floor (root size 2 to 2.5) then cropped post-capture at native pixels (no upscale, ffmpeg crop=960:540, centred on the subjects, shot 4 offset x 450), so a head is about 40 px at 268 px; shots 1 and 6 stay uncropped (opening and closing, j weak assumed). 1: Shogun was absent because the Sanctuary step "animals are kept out" despawned him every frame, that step is removed from 1 and 6; the hut is another place, dropped from the line. 2: Nelim gets Roo_HD_Hair_Highpony (it had the default bun). 3: Quill faces East (facing South showed a blank orange face, a Sanctuary-side anomaly, not BiB code), Ryu faces South smiling, no Cloth (it never showed). 4: row z=128, station (178,127) behind, lit Brazier (176,127), Plant_Daylily (175,127). 5: Plant_Daylily (153,97) and Plant_YellowTallGrass (155,97) in the south foreground, the hut falls outside the crop. 6: hour 18, Nelim (165,173), Quill (166,173) facing East, Soren (167,173) in one row, Shogun lies at (165,172). Expression: pawns with a face-pack gene (Soren, Ryu, Miel, Nelim in 4 and 5) get no mouth step, the pack draws the mouth, so a neutral mouth is planned there (written trait, no malus).
  # V5 INSTANTS (gesture, instant, how obtained; criterion e). 1: just before she steps off the bridge, Nelim carries the Cloth East while Shogun waits facing the camera (carries the item, animal stands at, 30 frames pause); the hut line of v3 is void. 2: just after the fitting, Miel (facing West) looks at Nelim who shows her look to the camera (stands at facing, gaze toward what happens). 3: Quill (facing East) looks at Ryu, who shows his look facing the camera. 4: the four stand shoulder to shoulder after choosing a face (e weak, malus assumed: a gaze would hide a face pack); extra decor Plant_Daylily (176,129) and (178,129) behind the row. 5: Soren carries a WoodLog, just before he leans to the flowers. 6: just after the last guest left the mirror, Soren lifts a Torch (carries the item "Torch") for the evening, Quill looks East toward him, Shogun lies at Nelim feet. PLAN SCORES v5 (score-gallery, 2026-11-16, no capture yet): 1 4.0 (j weak assumed, k weak), 2 4.5, 3 4.5, 4 4.0 (e weak assumed), 5 4.0 (b weak in the crop), 6 4.0 (j weak assumed); series k weak (rhythm repeats row line-ups) -0.5 each; mean 4.17.
  # (v3 text, kept for the record; the V4 line above decides).
  #
  # STORY. One spring day at Nelim's Sanctuary (fixture Nelims-tribe, SaB base map). Nelim (Virginie, protagonist, WDI
  # body) opens a "look day": her friends come to the mirror (Ideology StylingStation, the same piece in shots 2, 4 and
  # 6) and each leaves with the look the mod gives. 08:00 to 17:00, one start hour per image, clear sky, 20 degrees.
  # Colonists smile (MouthSmile, LidCheerful, normal+blink, face held neutral, no sweat). Decor of a shot is placed for
  # that shot and removed after it (the decor is removed).
  # GESTURES. Only steps that exist (PickleTools docs/steps.md): "X stands at (x, z) facing D", "X carries the item
  # I", "X puts down what it carries", "X stands next to Y", "the animal A stands at (x, z) facing D". A pose is a
  # carried item plus a facing; the pause is 30 ticks after the setup. No walking, sitting or use-the-mirror job: no
  # step does it, none is planned (a pawn caught mid-step would need a new NPT step, asked if the owner wants it).
  # Each shot names its instant ("just before / just after").
  # CLOTHES (continuity, canon looks of the roster). Nelim Apparel_BasicShirt cream (230, 224, 206) + Apparel_Pants, hair
  # Roo_HD_Hair_Highpony (Hair_DarkSaturatedReddish). Miel Apparel_CollarShirt moss green + Apparel_Pants, Roo_Royal_
  # NaturalcurlsHD (Hair_DarkBlack). Soren Apparel_BasicShirt copper (176, 112, 64) + Apparel_Pants, Roo_HD_Hair_Tidy
  # (Hair_DarkReddish). Ryu Apparel_BasicShirt blue (40, 70, 130) + Apparel_Pants, Roo_Royal_CleancutHD (Hair_InkBlack).
  # Quill Apparel_CollarShirt #556B2F + Apparel_Pants + Apparel_PAGGlasses, VHE_Librarian. One change, said in the story:
  # shot 2 is the fitting (UnderWhere_Tanktop + LTS_Shorts, so the bodies read); they dress right after.
  #
  # OWNER VALIDATIONS (quoted, rule 3 of sync-nsb-npt): "oui" on 2026-11-09, BiB session, for the gallery only: BiB look
  # genes or Mod options on Nelim, Miel, Soren and Ryu (body WDI or Vanilla, face UNAGI / Nice FA / Retexture / Reel);
  # "oui" on 2026-11-09 for Quill Aster with BiB_BodyVanilla. All colonists and Shogun (labrador) are NSB. The mod adds no
  # animal (rule 5 n/a). Outfits are free.
  #
  # DEPMAP. The Sanctuary map (SaB wsl-deps.sanctuary.map, nothing challenged) plus: brrainz.harmony, WDI Realistic
  # Bodies, UNAGI.FacialAnimation, Andromeda.FacialAnimation (Nice FA), Barb.Facetexture, Reel.FacialAnims, then
  # nelim.biotechbodies (path:BiotechBodies/Mod) last. Map file Tests/Pickle/wsl-deps.gallery.map (written at rate-gallery).
  # Risk: Nice FA is incompatible with NL Experimentals on its own side and Reel needs VFE Core, VTE, VTE-FA; if a pack
  # cannot share the map its shot moves to a second map (second ticket), the story is unchanged.
  # THUMBNAIL (268 px). A body or face difference reads only in a tight shot: shots 2 to 5 are the proof of the mod, shots 1
  # and 6 are the opening and the closing (story, criterion j weak and assumed there, -0.5 each).
  #
  # SHOTS (index | name | place | hour | subject | composition | living | decor | steps | subtitle)
  # 1 | 1-bridge-morning | river-bridge | 08:00, clear, +10 min after the setup | Nelim brings her cloth bundle to the tea room
  #   (the hut is in frame) | wide, bridge diagonal in the foreground, hut small in the background, light from the east |
  #   Nelim (Female, BiB_BodyWdi) stands at the east end facing East, carrying a cloth bundle (carries the item "Cloth"), smiling,
  #   "just before she reaches the hut"; Shogun stands at her side facing South (the camera) | TorchLamp lit at each end of the
  #   bridge, Brazier lit, two PlantPot with Plant_Daylily fully grown, Plant_YellowTallGrass along the rail | steps: Nelim has
  #   her own face, I frame the sanctuary "river-bridge", carries the item, the animal Shogun stands at facing South |
  #   "Nelim brings the day's looks across the bridge."
  # 2 | 2-two-bodies | hut (tea room) | 09:00, clear, +60 min | the body slot: same Female body, two looks | tight two-shot,
  #   rectangle around two pawns, low table in front, off-centre left | Nelim (BiB_BodyWdi) and Miel (BiB_BodyVanilla) side by
  #   side, both in UnderWhere_Tanktop and LTS_Shorts (the fitting), both smiling, Nelim holding a cup (carries the item
  #   "Meal"), Miel facing the mirror; "just after Miel stepped out of the chair" | StylingStation behind them, low table with
  #   two MealSimple items, cushions, andon lit, two PlantPot with Plant_Daylily | steps: body type is Female, has the gene, wears,
  #   stands at facing, I frame the rectangle | "Same body type, two looks: WDI and vanilla."
  # 3 | 3-quill-and-ryu | cloister (v6: statue-garden gave a coil-like statue between the pawns) | 11:00, clear, +120 min | the neutral body: Quill (Gender.None, vanilla look) beside
  #   Ryu (WDI) | tight two-shot knees up, Quill left of centre, Ryu right, statues behind, short shadows | Quill Aster
  #   (BiB_BodyVanilla, Neutre_AverageNormal) carrying a cloth bundle (carries the item "Cloth"), Ryu (Male,
  #   BiB_BodyWdi) beside her, both dressed (clothes above), smiling; "just before Quill lays the cloth at the statue" |
  #   statues of the garden, three PlantPot with Plant_Daylily fully grown, TorchLamp lit, Brazier lit | steps: has the gene,
  #   stands at facing, carries the item, I frame the rectangle | "A neutral pawn, a body that finally fits."
  # 4 | 4-faces-at-the-mirror | cloister | 13:00, clear, +120 min | the face slot: four packs around the mirror | tight,
  #   four heads and shoulders, shoulder to shoulder, torii out of focus behind | Nelim (BiB_FaceUnagi), Miel (BiB_FaceNiceFA),
  #   Soren (BiB_FaceFARetexture), Ryu (BiB_FaceReel), clothes above, canon hair above, each holding a cup (carries the item "MealSimple"), all smiling; "just after the four
  #   chose a face" | StylingStation in the middle, wall lanterns lit, PlantPot with Plant_Daylily at each end, Brazier lit |
  #   steps: has the gene, face parts logged, stands at facing, I frame the rectangle | "Four face packs, four faces: one gene
  #   each."
  # 5 | 5-soren-portrait | flower-garden | 15:00, clear, +120 min | one face close up (Retexture) | tight portrait, head and
  #   shoulders at the game's real zoom (never an upscaled crop), flowers in the foreground, soft afternoon light | Soren
  #   (BiB_FaceFARetexture, Male, MouthSmile) stands facing a flower, one step in front of it, carrying a log (carries the item "WoodLog") for the flower edging, "just before he leans in" |
  #   Plant_Daylily and Plant_YellowTallGrass fully grown in the foreground, three PlantPot, Brazier lit (V9 2026-11-16: TorchLamp dropped, it drew as a green ghost top left in v8; native crop 960x540 now at x 400 y 450 so the daylilies show) |
  #   steps: face kit neutral, face parts, stands at facing, I frame the rectangle | "A close look at a face pack: Barb's
  #   retexture."
  # 6 | 6-water-garden-dusk | water-garden | 17:00, clear, +120 min | closing: three friends and a dog, one pond | wide, five
  #   pawns grouped tight at the pond edge (Nelim, Miel, Soren, Ryu, Quill), lilies in the foreground, low warm light, Shogun
  #   lying at Nelim's feet facing South | looks of shots 2 to 4, clothes above, Soren carrying a lantern (carries the item
  #   "Torch"), all smiling; "just after the last guest left the mirror" | TorchLamp lit at each side, two PlantPot with
  #   Plant_Daylily, StylingStation at the edge, Brazier lit | steps: has the gene, I set the hour to 17, stands at facing,
  #   the animal Shogun lies at facing South | "Look day ends: everyone keeps the look they chose."
  # 7 | 7-options-window | window-backdrop-for-height | any | the Mod options page of Biotech Bodies (default look for everyone
  #   and per race) | interface window cropped (Crop-SettingsShot), outside the story, no subtitle, last slot | none | none |
  #   steps: studio presentation mode, open mod options Biotech Bodies, colonist bar hidden | (no subtitle)

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I close all dialogs
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And I set the weather to "Clear"

  # SCENARIOS (written 2026-11-14 from the shotlist above). Cells are first guesses around the cell of each place (STATUS.md, table of places): the first run reads them.
  # Colonists other than Nelim are generated from their canon (SanctuaryBacklot sanctuary-daily.feature) and get their BiB genes (owner oui 2026-11-09).
  # A pawn with a pack face gene gets no mouth, lids or brows step: it would override the pack. Others get the smile kit.

  Scenario: 1-bridge-morning
    Given I set the hour to 8
    And Nelim's Sanctuary: I am at the sanctuary "river-bridge"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (230, 224, 206)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants"
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_BodyWdi"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (133, 124)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (133, 124) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (137, 124)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (137, 124) is lit
    And Nelim's Pickle Tools: I place the decor "Brazier" at (136, 125)
    And Nelim's Pickle Tools: the decor "Brazier" at (136, 125) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (134, 125) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (138, 126) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (135, 122) fully grown
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" stands at (135, 124) facing South
    And Nelim's Pickle Tools: "Nelim" carries the item "Cloth"
    And Nelim's Pickle Tools: the animal "Shogun" stands at (134, 124) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: I frame the area centred on (135, 125) at root size 2
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 1-bridge-morning"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 2-two-bodies
    Given I set the hour to 9
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "hut"
    And Nelim's Sanctuary: I am at the sanctuary "hut"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: a colonist "Miel" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Miel" loses all genes
    And Nelim's Pickle Tools: "Miel" gender is Female
    And "Miel" is 34 years old
    And Nelim's Pickle Tools: "Miel" body type is Hulk
    And Nelim's Pickle Tools: "Miel" head type is "Female_AverageWide"
    And Nelim's Pickle Tools: "Miel" has the gene "GES_Skin_Chocolate"
    And Nelim's Pickle Tools: "Miel" has the gene "Hair_DarkBlack"
    And Nelim's Pickle Tools: "Miel" has the gene "Eyes_Orange"
    And Nelim's Pickle Tools: "Miel" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Miel" hairstyle is "Roo_Royal_NaturalcurlsHD"
    And Nelim's Pickle Tools: "Miel" face tattoo is "none"
    And Nelim's Pickle Tools: "Miel" beard is "none"
    And Nelim's Pickle Tools: "Miel" has the gene "BiB_BodyWdi"
    And Nelim's Pickle Tools: "Miel" is undressed
    And Nelim's Pickle Tools: "Miel" wears "Apparel_CollarShirt" dyed rgb (196, 150, 80)
    And Nelim's Pickle Tools: "Miel" also wears "Apparel_Pants" dyed rgb (140, 160, 120)
    And Nelim's Pickle Tools: "Miel" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Miel" brows are "BrowTriangle"
    And Nelim's Pickle Tools: "Miel" lids are "LidFlirty"
    And Nelim's Pickle Tools: "Miel" eyeballs are "Empathetic"
    And Nelim's Pickle Tools: "Miel" face skin is "SkinEyeshadow"
    And Nelim's Pickle Tools: "Miel" face is held neutral
    And Nelim's Pickle Tools: "Miel" facial expression is "normal+moodCheerful"
    And Nelim's Pickle Tools: a colonist "Mira" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Mira" loses all genes
    And Nelim's Pickle Tools: "Mira" gender is Female
    And "Mira" is 34 years old
    And Nelim's Pickle Tools: "Mira" body type is Hulk
    And Nelim's Pickle Tools: "Mira" head type is "Female_AverageWide"
    And Nelim's Pickle Tools: "Mira" has the gene "GES_Skin_Chocolate"
    And Nelim's Pickle Tools: "Mira" has the gene "Hair_DarkBlack"
    And Nelim's Pickle Tools: "Mira" has the gene "Eyes_Orange"
    And Nelim's Pickle Tools: "Mira" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Mira" hairstyle is "Roo_Royal_NaturalcurlsHD"
    And Nelim's Pickle Tools: "Mira" face tattoo is "none"
    And Nelim's Pickle Tools: "Mira" beard is "none"
    And Nelim's Pickle Tools: "Mira" has the gene "BiB_BodyVanilla"
    And Nelim's Pickle Tools: "Mira" is undressed
    And Nelim's Pickle Tools: "Mira" wears "Apparel_CollarShirt" dyed rgb (196, 150, 80)
    And Nelim's Pickle Tools: "Mira" also wears "Apparel_Pants" dyed rgb (140, 160, 120)
    And Nelim's Pickle Tools: "Mira" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Mira" brows are "BrowTriangle"
    And Nelim's Pickle Tools: "Mira" lids are "LidFlirty"
    And Nelim's Pickle Tools: "Mira" eyeballs are "Empathetic"
    And Nelim's Pickle Tools: "Mira" face skin is "SkinEyeshadow"
    And Nelim's Pickle Tools: "Mira" face is held neutral
    And Nelim's Pickle Tools: "Mira" facial expression is "normal+moodCheerful"
    And Nelim's Pickle Tools: I place the decor "StylingStation" at (142, 73)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (139, 75)
    And Nelim's Pickle Tools: the decor "Brazier" at (139, 75) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (144, 72) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (143, 75) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (141, 75) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (142, 75) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (139, 74) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (142, 74) fully grown
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (144, 74)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (144, 74) is lit
    And Nelim's Pickle Tools: "Miel" stands at (140, 74) facing South
    And Nelim's Pickle Tools: "Mira" stands at (141, 74) facing South
    And Nelim's Pickle Tools: the face parts of "Miel" are logged
    And Nelim's Pickle Tools: the face parts of "Mira" are logged
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: I frame the area centred on the point (140.5, 74) at root size 2
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 2-two-bodies"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 3-nelim-turn
    Given I set the hour to 12
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "cloister"
    And Nelim's Sanctuary: I am at the sanctuary "cloister"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (230, 224, 206)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants"
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_BodyWdi"
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_FaceUnagi"
    And Nelim's Pickle Tools: I place the decor "StylingStation" at (178, 127)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (176, 127)
    And Nelim's Pickle Tools: the decor "Brazier" at (176, 127) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (175, 126)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (175, 126) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (181, 126)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (181, 126) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (175, 127) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (176, 129) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (178, 129) fully grown
    And Nelim's Pickle Tools: I place the decor "Stool" at (179, 128)
    And Nelim's Pickle Tools: I place the decor "EndTable" at (180, 128)
    And Nelim's Pickle Tools: I place the decor "Armchair" at (181, 128)
    And Nelim's Pickle Tools: I place the decor "Bookcase" at (182, 127)
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" stands at (177, 128) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Cloth"
    And Nelim's Pickle Tools: the animal "Shogun" stands at (175, 128) facing South
    And Nelim's Pickle Tools: the face parts of "Nelim" are logged
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: I frame the area centred on the point (177.5, 128) at root size 2
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 3-nelim-turn"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 4-faces-at-the-mirror
    Given I set the hour to 13
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "cloister"
    And Nelim's Sanctuary: I am at the sanctuary "cloister"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (230, 224, 206)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants"
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_FaceUnagi"
    And Nelim's Pickle Tools: a colonist "Miel" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Miel" loses all genes
    And Nelim's Pickle Tools: "Miel" gender is Female
    And "Miel" is 34 years old
    And Nelim's Pickle Tools: "Miel" body type is Thin
    And Nelim's Pickle Tools: "Miel" head type is "Female_AverageWide"
    And Nelim's Pickle Tools: "Miel" has the gene "GES_Skin_Chocolate"
    And Nelim's Pickle Tools: "Miel" has the gene "Hair_DarkBlack"
    And Nelim's Pickle Tools: "Miel" has the gene "Eyes_Orange"
    And Nelim's Pickle Tools: "Miel" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Miel" hairstyle is "VHE_SideBraid"
    And Nelim's Pickle Tools: "Miel" has the gene "BiB_FaceNiceFA"
    And Nelim's Pickle Tools: "Miel" is undressed
    And Nelim's Pickle Tools: "Miel" wears "Apparel_CollarShirt" dyed rgb (107, 142, 35)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_Pants"
    And Nelim's Pickle Tools: a colonist "Soren" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Soren" loses all genes
    And Nelim's Pickle Tools: "Soren" gender is Male
    And "Soren" is 38 years old
    And Nelim's Pickle Tools: "Soren" body type is Male
    And Nelim's Pickle Tools: "Soren" head type is "Male_AverageWide"
    And Nelim's Pickle Tools: "Soren" has the gene "Skin_Melanin5"
    And Nelim's Pickle Tools: "Soren" has the gene "Hair_DarkReddish"
    And Nelim's Pickle Tools: "Soren" has the gene "Eyes_DarkGreen"
    And Nelim's Pickle Tools: "Soren" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Soren" hairstyle is "Roo_HD_Hair_Tidy"
    And Nelim's Pickle Tools: "Soren" has the gene "BiB_FaceFARetexture"
    And Nelim's Pickle Tools: "Soren" is undressed
    And Nelim's Pickle Tools: "Soren" wears "Apparel_BasicShirt" dyed rgb (176, 112, 64)
    And Nelim's Pickle Tools: "Soren" wears "Apparel_Pants"
    And Nelim's Pickle Tools: a colonist "Ryu" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Ryu" loses all genes
    And Nelim's Pickle Tools: "Ryu" gender is Male
    And "Ryu" is 43 years old
    And Nelim's Pickle Tools: "Ryu" body type is Thin
    And Nelim's Pickle Tools: "Ryu" head type is "Male_NarrowPointy"
    And Nelim's Pickle Tools: "Ryu" has the gene "Skin_Melanin4"
    And Nelim's Pickle Tools: "Ryu" has the gene "Hair_InkBlack"
    And Nelim's Pickle Tools: "Ryu" has the gene "Eyes_SkyBlue"
    And Nelim's Pickle Tools: "Ryu" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Ryu" hairstyle is "Roo_Royal_CleancutHD"
    And Nelim's Pickle Tools: "Ryu" has the gene "BiB_FaceReel"
    And Nelim's Pickle Tools: "Ryu" is undressed
    And Nelim's Pickle Tools: "Ryu" wears "Apparel_BasicShirt" dyed rgb (40, 70, 130)
    And Nelim's Pickle Tools: "Ryu" wears "Apparel_Pants"
    And Nelim's Pickle Tools: I place the decor "StylingStation" at (178, 127)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (176, 127)
    And Nelim's Pickle Tools: the decor "Brazier" at (176, 127) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (175, 127) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (176, 129) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (178, 129) fully grown
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (175, 126)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (175, 126) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (181, 126)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (181, 126) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (174, 131) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (182, 129) fully grown
    And Nelim's Pickle Tools: "Nelim" stands at (175, 128) facing South
    And Nelim's Pickle Tools: "Miel" stands at (176, 128) facing South
    And Nelim's Pickle Tools: "Soren" stands at (177, 128) facing South
    And Nelim's Pickle Tools: "Ryu" stands at (178, 128) facing South
    And Nelim's Pickle Tools: the face parts of "Nelim" are logged
    And Nelim's Pickle Tools: the face parts of "Miel" are logged
    And Nelim's Pickle Tools: the face parts of "Soren" are logged
    And Nelim's Pickle Tools: the face parts of "Ryu" are logged
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: I frame the area centred on the point (176.5, 128) at root size 2
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 4-faces-at-the-mirror"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 5-soren-portrait
    Given I set the hour to 15
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "flower-garden"
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: a colonist "Soren" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Soren" loses all genes
    And Nelim's Pickle Tools: "Soren" gender is Male
    And "Soren" is 38 years old
    And Nelim's Pickle Tools: "Soren" body type is Male
    And Nelim's Pickle Tools: "Soren" head type is "Male_AverageWide"
    And Nelim's Pickle Tools: "Soren" has the gene "Skin_Melanin5"
    And Nelim's Pickle Tools: "Soren" has the gene "Hair_DarkReddish"
    And Nelim's Pickle Tools: "Soren" has the gene "Eyes_DarkGreen"
    And Nelim's Pickle Tools: "Soren" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Soren" hairstyle is "Roo_HD_Hair_Tidy"
    And Nelim's Pickle Tools: "Soren" has the gene "BiB_FaceFARetexture"
    And Nelim's Pickle Tools: "Soren" is undressed
    And Nelim's Pickle Tools: "Soren" wears "Apparel_BasicShirt" dyed rgb (176, 112, 64)
    And Nelim's Pickle Tools: "Soren" wears "Apparel_Pants"
    And Nelim's Pickle Tools: "Soren" stands at (154, 109) facing South
    And Nelim's Pickle Tools: "Soren" carries the item "WoodLog"
    And Nelim's Pickle Tools: the face parts of "Soren" are logged
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: the camera frames the head of "Soren" at root size 2
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 5-soren-portrait"

  Scenario: 6-water-garden-dusk
    Given I set the hour to 18
    And Nelim's Sanctuary: I am at the sanctuary "water-garden"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (230, 224, 206)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants"
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_BodyWdi"
    And Nelim's Pickle Tools: a colonist "Soren" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Soren" loses all genes
    And Nelim's Pickle Tools: "Soren" gender is Male
    And "Soren" is 38 years old
    And Nelim's Pickle Tools: "Soren" body type is Male
    And Nelim's Pickle Tools: "Soren" head type is "Male_AverageWide"
    And Nelim's Pickle Tools: "Soren" has the gene "Skin_Melanin5"
    And Nelim's Pickle Tools: "Soren" has the gene "Hair_DarkReddish"
    And Nelim's Pickle Tools: "Soren" has the gene "Eyes_DarkGreen"
    And Nelim's Pickle Tools: "Soren" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Soren" hairstyle is "Roo_HD_Hair_Tidy"
    And Nelim's Pickle Tools: "Soren" has the gene "BiB_FaceFARetexture"
    And Nelim's Pickle Tools: "Soren" is undressed
    And Nelim's Pickle Tools: "Soren" wears "Apparel_BasicShirt" dyed rgb (176, 112, 64)
    And Nelim's Pickle Tools: "Soren" wears "Apparel_Pants"
    And Nelim's Pickle Tools: a colonist "Miel" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Miel" loses all genes
    And Nelim's Pickle Tools: "Miel" gender is Female
    And "Miel" is 34 years old
    And Nelim's Pickle Tools: "Miel" body type is Thin
    And Nelim's Pickle Tools: "Miel" head type is "Female_AverageWide"
    And Nelim's Pickle Tools: "Miel" has the gene "GES_Skin_Chocolate"
    And Nelim's Pickle Tools: "Miel" has the gene "Hair_DarkBlack"
    And Nelim's Pickle Tools: "Miel" has the gene "Eyes_Orange"
    And Nelim's Pickle Tools: "Miel" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Miel" hairstyle is "VHE_SideBraid"
    And Nelim's Pickle Tools: "Miel" has the gene "BiB_FaceNiceFA"
    And Nelim's Pickle Tools: "Miel" has the gene "BiB_BodyVanilla"
    And Nelim's Pickle Tools: "Miel" is undressed
    And Nelim's Pickle Tools: "Miel" wears "Apparel_CollarShirt" dyed rgb (107, 142, 35)
    And Nelim's Pickle Tools: "Miel" wears "Apparel_Pants"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (164, 172)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (164, 172) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (170, 172)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (170, 172) is lit
    And Nelim's Pickle Tools: I place the decor "Brazier" at (169, 174)
    And Nelim's Pickle Tools: the decor "Brazier" at (169, 174) is lit
    And Nelim's Pickle Tools: I place the decor "StylingStation" at (172, 174)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (164, 174) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (166, 174) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (168, 174) fully grown
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Miel" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Miel" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Miel" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Miel" face is held neutral
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" stands at (165, 173) facing West
    And Nelim's Pickle Tools: "Soren" stands at (167, 173) facing East
    And Nelim's Pickle Tools: "Soren" carries the item "WoodLog"
    And Nelim's Pickle Tools: "Miel" stands at (166, 173) facing North
    And Nelim's Pickle Tools: the animal "Shogun" stands at (164, 173) facing South
    And Nelim's Pickle Tools: I frame the area centred on the point (166, 173) at root size 2
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 6-water-garden-dusk"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 7-genes-tab
    Given I set the hour to 12
    And Nelim's Sanctuary: I am at the sanctuary "cloister"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_BodyWdi"
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_FaceUnagi"
    And Nelim's Pickle Tools: "Nelim" stands at (177, 128) facing East
    And Nelim's Pickle Tools: I select the thing of def "Human" at (177, 128)
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: I open the hidden "Genes" inspect tab
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 7-genes-tab"

  Scenario: 8-options-window
    Given I set the hour to 12
    And Nelim's Sanctuary: I am at the sanctuary "window-backdrop-for-height"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: I open the mod options page of the mod "nelim.biotechbodies"
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 8-options-window"
    And Nelim's Pickle Tools: I close the mod options window
