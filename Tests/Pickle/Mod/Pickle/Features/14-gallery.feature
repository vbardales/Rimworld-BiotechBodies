@gallery @wip @timeout:300
Feature: the Steam gallery of Biotech Bodies, one day of looks at the Sanctuary

  # SHOTLIST (v3, 2026-11-09, after the Opus director pass and a first score-gallery; plan only, nothing is played).
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
  # shot 2 is the fitting (UnderWhere_Tanktop + Apparel_Shorts, so the bodies read); they dress right after.
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
  #   side, both in UnderWhere_Tanktop and Apparel_Shorts (the fitting), both smiling, Nelim holding a cup (carries the item
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
  #   Soren (BiB_FaceRetexture), Ryu (BiB_FaceReel), clothes above, canon hair above, each holding a cup (carries the item "MealSimple"), each holding a cup (carries the item "MealSimple"), all smiling; "just after the four
  #   chose a face" | StylingStation in the middle, wall lanterns lit, PlantPot with Plant_Daylily at each end, Brazier lit |
  #   steps: has the gene, face parts logged, stands at facing, I frame the rectangle | "Four face packs, four faces: one gene
  #   each."
  # 5 | 5-soren-portrait | flower-garden | 15:00, clear, +120 min | one face close up (Retexture) | tight portrait, head and
  #   shoulders at the game's real zoom (never an upscaled crop), flowers in the foreground, soft afternoon light | Soren
  #   (BiB_FaceRetexture, Male, MouthSmile) stands facing a flower, one step in front of it, carrying a log (carries the item "WoodLog") for the flower edging, "just before he leans in" |
  #   Plant_Daylily and Plant_YellowTallGrass fully grown in the foreground, three PlantPot, TorchLamp lit, Brazier lit |
  #   steps: face kit neutral, face parts, stands at facing, I frame the rectangle | "A close look at a face pack: Barb's
  #   retexture."
  # 6 | 6-water-garden-dusk | water-garden | 17:00, clear, +120 min | closing: five friends, five looks, one pond | wide, five
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
