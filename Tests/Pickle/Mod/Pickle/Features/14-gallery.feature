@gallery @review @timeout:900 @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.clearscreen @requires:nelim.pickletools.screenshotmode @requires:UNAGI.FacialAnimation @requires:Andromeda.FacialAnimation @requires:Barb.Facetexture @requires:Reel.FacialAnims @requires:WDI.Realistic.Bodies
Feature: the Steam gallery of Biotech Bodies, one day of looks at the Sanctuary

  # SHOTLIST (v4, 2026-11-15, after the first full run f03a: 6 of 6 green, 6 of 6 captures REDO, then an Opus director pass; plan only, nothing replayed yet).
  # V4 CHANGES (they win over the v3 lines below): framing tightened (root size 2 is the floor): 1 at 3.5 on (136,124), 2 at 2, 3 at 2.5, 4 at 2.5 on (176.5,128), 5 head at 2, 6 at 3.5. No carried item on 2 and 4 (the item square hid the body and the faces); 3 puts the Cloth down at its feet. 4: one row, (175..178,128), station at (178,127); row 129 has Columns (SANCTUARY-CASES cloister). 5 moves to statue-garden (plain soil behind the head, flowers only in the foreground). 6: Nelim, Soren, Quill and Shogun only (five pawns do not read at 268 px), no carried lantern. Same mirror in 2, 4, 6; framing tightens from 2 to 5; clothes never change.
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
  # "oui" on 2026-11-09 for Quill Aster with BiB_VanillaBody. All colonists and Shogun (labrador) are NSB. The mod adds no
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
  #   Nelim (Female, BiB_WdiBody) stands at the east end facing East, carrying a cloth bundle (carries the item "Cloth"), smiling,
  #   "just before she reaches the hut"; Shogun stands at her side facing South (the camera) | TorchLamp lit at each end of the
  #   bridge, Brazier lit, two PlantPot with Plant_Daylily fully grown, Plant_YellowTallGrass along the rail | steps: Nelim has
  #   her own face, I frame the sanctuary "river-bridge", carries the item, the animal Shogun stands at facing South |
  #   "Nelim brings the day's looks across the bridge."
  # 2 | 2-two-bodies | hut (tea room) | 09:00, clear, +60 min | the body slot: same Female body, two looks | tight two-shot,
  #   rectangle around two pawns, low table in front, off-centre left | Nelim (BiB_WdiBody) and Miel (BiB_VanillaBody) side by
  #   side, both in UnderWhere_Tanktop and LTS_Shorts (the fitting), both smiling, Nelim holding a cup (carries the item
  #   "Meal"), Miel facing the mirror; "just after Miel stepped out of the chair" | StylingStation behind them, low table with
  #   two MealSimple items, cushions, andon lit, two PlantPot with Plant_Daylily | steps: body type is Female, has the gene, wears,
  #   stands at facing, I frame the rectangle | "Same body type, two looks: WDI and vanilla."
  # 3 | 3-quill-statues | statue-garden | 11:00, clear, +120 min | the neutral body: Quill (Gender.None, vanilla look) beside
  #   Ryu (WDI) | tight two-shot knees up, Quill left of centre, Ryu right, statues behind, short shadows | Quill Aster
  #   (BiB_VanillaBody, Neutre_AverageNormal) carrying a cloth bundle (carries the item "Cloth"), Ryu (Male,
  #   BiB_WdiBody) beside her, both dressed (clothes above), smiling; "just before Quill lays the cloth at the statue" |
  #   statues of the garden, three PlantPot with Plant_Daylily fully grown, TorchLamp lit, Brazier lit | steps: has the gene,
  #   stands at facing, carries the item, I frame the rectangle | "A neutral pawn, a body that finally fits."
  # 4 | 4-faces-at-the-mirror | cloister | 13:00, clear, +120 min | the face slot: four packs around the mirror | tight,
  #   four heads and shoulders, shoulder to shoulder, torii out of focus behind | Nelim (BiB_FaceUnagi), Miel (BiB_FaceNiceFA),
  #   Soren (BiB_FaceRetexture), Ryu (BiB_FaceReel), clothes above, canon hair above, each holding a cup (carries the item "MealSimple"), all smiling; "just after the four
  #   chose a face" | StylingStation in the middle, wall lanterns lit, PlantPot with Plant_Daylily at each end, Brazier lit |
  #   steps: has the gene, face parts logged, stands at facing, I frame the rectangle | "Four face packs, four faces: one gene
  #   each."
  # 5 | 5-soren-portrait | statue-garden | 15:00, clear, +120 min | one face close up (Retexture) | tight portrait, head and
  #   shoulders at the game's real zoom (never an upscaled crop), flowers in the foreground, soft afternoon light | Soren
  #   (BiB_FaceRetexture, Male, MouthSmile) stands facing a flower, one step in front of it, carrying a log (carries the item "WoodLog") for the flower edging, "just before he leans in" |
  #   Plant_Daylily and Plant_YellowTallGrass fully grown in the foreground, three PlantPot, TorchLamp lit, Brazier lit |
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
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_WdiBody"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (133, 124)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (133, 124) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (137, 124)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (137, 124) is lit
    And Nelim's Pickle Tools: I place the decor "Brazier" at (136, 126)
    And Nelim's Pickle Tools: the decor "Brazier" at (136, 126) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (134, 126) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (138, 126) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (135, 122) fully grown
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" stands at (135, 124) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Cloth"
    And Nelim's Pickle Tools: the animal "Shogun" stands at (134, 124) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: I frame the area centred on (136, 124) at root size 3.5
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
    And Nelim's Pickle Tools: "Nelim" wears "UnderWhere_Tanktop"
    And Nelim's Pickle Tools: "Nelim" also wears "LTS_Shorts"
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_WdiBody"
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
    And Nelim's Pickle Tools: "Miel" has the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Miel" is undressed
    And Nelim's Pickle Tools: "Miel" wears "UnderWhere_Tanktop"
    And Nelim's Pickle Tools: "Miel" also wears "LTS_Shorts"
    And Nelim's Pickle Tools: I place the decor "StylingStation" at (142, 73)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (139, 75)
    And Nelim's Pickle Tools: the decor "Brazier" at (139, 75) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (144, 72) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (143, 75) fully grown
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Miel" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Miel" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Miel" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Miel" face is held neutral
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" stands at (140, 74) facing South
    And Nelim's Pickle Tools: "Miel" stands at (141, 74) facing West
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: I frame the area centred on the point (140.5, 74) at root size 2
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 2-two-bodies"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 3-quill-statues
    Given I set the hour to 11
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "statue-garden"
    And Nelim's Sanctuary: I am at the sanctuary "statue-garden"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: a colonist "Quill" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Quill" loses all genes
    And Nelim's Pickle Tools: "Quill" gender is Neutre
    And "Quill" is 36 years old
    And Nelim's Pickle Tools: "Quill" head type is "Male_NarrowWide"
    And Nelim's Pickle Tools: "Quill" has the gene "Skin_Melanin7"
    And Nelim's Pickle Tools: "Quill" has the gene "Hair_LightOrange"
    And Nelim's Pickle Tools: "Quill" has the gene "Eyes_DarkCyan"
    And Nelim's Pickle Tools: "Quill" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Quill" hairstyle is "VHE_Librarian"
    And Nelim's Pickle Tools: "Quill" has the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Quill" is undressed
    And Nelim's Pickle Tools: "Quill" wears "Apparel_CollarShirt" dyed rgb (85, 107, 47)
    And Nelim's Pickle Tools: "Quill" wears "Apparel_Pants"
    And Nelim's Pickle Tools: "Quill" wears "Apparel_PAGGlasses"
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
    And Nelim's Pickle Tools: "Ryu" has the gene "BiB_WdiBody"
    And Nelim's Pickle Tools: "Ryu" is undressed
    And Nelim's Pickle Tools: "Ryu" wears "Apparel_BasicShirt" dyed rgb (40, 70, 130)
    And Nelim's Pickle Tools: "Ryu" wears "Apparel_Pants"
    And Nelim's Pickle Tools: I place the decor "Brazier" at (153, 99)
    And Nelim's Pickle Tools: the decor "Brazier" at (153, 99) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (157, 98)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (157, 98) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (152, 98) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (158, 100) fully grown
    And Nelim's Pickle Tools: "Quill" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Quill" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Quill" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Quill" face is held neutral
    And Nelim's Pickle Tools: "Ryu" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Ryu" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Ryu" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Ryu" face is held neutral
    And Nelim's Pickle Tools: "Quill" stands at (154, 99) facing East
    And Nelim's Pickle Tools: "Ryu" stands at (156, 99) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: I frame the area centred on the point (155, 99) at root size 2.5
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 3-quill-statues"
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
    And Nelim's Pickle Tools: "Soren" has the gene "BiB_FaceRetexture"
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
    And Nelim's Pickle Tools: I frame the area centred on the point (176.5, 128) at root size 2.5
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 4-faces-at-the-mirror"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 5-soren-portrait
    Given I set the hour to 15
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "statue-garden"
    And Nelim's Sanctuary: I am at the sanctuary "statue-garden"
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
    And Nelim's Pickle Tools: "Soren" has the gene "BiB_FaceRetexture"
    And Nelim's Pickle Tools: "Soren" is undressed
    And Nelim's Pickle Tools: "Soren" wears "Apparel_BasicShirt" dyed rgb (176, 112, 64)
    And Nelim's Pickle Tools: "Soren" wears "Apparel_Pants"
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (153, 97) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (155, 97) fully grown
    And Nelim's Pickle Tools: I place the decor "Brazier" at (156, 97)
    And Nelim's Pickle Tools: the decor "Brazier" at (156, 97) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (152, 97)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (152, 97) is lit
    And Nelim's Pickle Tools: "Soren" stands at (154, 99) facing South
    And Nelim's Pickle Tools: "Soren" carries the item "WoodLog"
    And Nelim's Pickle Tools: the face parts of "Soren" are logged
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: the camera frames the head of "Soren" at root size 2
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 5-soren-portrait"
    And Nelim's Pickle Tools: the decor is removed

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
    And Nelim's Pickle Tools: "Nelim" has the gene "BiB_WdiBody"
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
    And Nelim's Pickle Tools: "Soren" has the gene "BiB_FaceRetexture"
    And Nelim's Pickle Tools: "Soren" is undressed
    And Nelim's Pickle Tools: "Soren" wears "Apparel_BasicShirt" dyed rgb (176, 112, 64)
    And Nelim's Pickle Tools: "Soren" wears "Apparel_Pants"
    And Nelim's Pickle Tools: a colonist "Quill" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Quill" loses all genes
    And Nelim's Pickle Tools: "Quill" gender is Neutre
    And "Quill" is 36 years old
    And Nelim's Pickle Tools: "Quill" head type is "Male_NarrowWide"
    And Nelim's Pickle Tools: "Quill" has the gene "Skin_Melanin7"
    And Nelim's Pickle Tools: "Quill" has the gene "Hair_LightOrange"
    And Nelim's Pickle Tools: "Quill" has the gene "Eyes_DarkCyan"
    And Nelim's Pickle Tools: "Quill" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Quill" hairstyle is "VHE_Librarian"
    And Nelim's Pickle Tools: "Quill" has the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Quill" is undressed
    And Nelim's Pickle Tools: "Quill" wears "Apparel_CollarShirt" dyed rgb (85, 107, 47)
    And Nelim's Pickle Tools: "Quill" wears "Apparel_Pants"
    And Nelim's Pickle Tools: "Quill" wears "Apparel_PAGGlasses"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (164, 172)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (164, 172) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (170, 172)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (170, 172) is lit
    And Nelim's Pickle Tools: I place the decor "Brazier" at (167, 176)
    And Nelim's Pickle Tools: the decor "Brazier" at (167, 176) is lit
    And Nelim's Pickle Tools: I place the decor "StylingStation" at (172, 174)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (165, 175) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (169, 175) fully grown
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: "Quill" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Quill" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Quill" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Quill" face is held neutral
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" stands at (165, 173) facing South
    And Nelim's Pickle Tools: "Soren" stands at (167, 173) facing South
    And Nelim's Pickle Tools: "Soren" carries the item "Torch"
    And Nelim's Pickle Tools: "Quill" stands at (166, 173) facing East
    And Nelim's Pickle Tools: the animal "Shogun" lies at (165, 172) facing South
    And Nelim's Pickle Tools: I frame the area centred on the point (166, 173) at root size 3.5
    And Nelim's Pickle Tools: I let 30 frames pass
    When Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "gallery 6-water-garden-dusk"
    And Nelim's Pickle Tools: the decor is removed
