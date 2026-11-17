# Body packs for 1.1.0 (PiI study, 2026-11-17)

Subscribers are current (Steam API, 2026-11-17). Versions are Workshop tags. "Local" means PiI read the installed folder. Nothing coded before 1.0.0 is out.

Finding: every pack read overwrites `Textures/Things/Pawn/Humanlike/Bodies/Naked_<Male|Female|Fat|Hulk|Thin>(+_Female)_{north,east,south}` in place (some also `PerfectBody`). Only the last loaded pack wins for everyone, so a pack cannot be offered beside another by the game alone. Idea to check (not verified): read the texture from the ModContentPack of the chosen pack (its own content list) instead of the shared path, as BiB already does for BiB/Vanilla/ and BiB/Wdi/.

## Owner lot 1 (2026-11-17, the eight packs Body Mod Mix and Match supports)

| Pack | Id | packageId | Subs | Notes |
|---|---|---|---|---|
| NL Realistic Body | 2820615654 | Nals.RealisticBody | 146360 | Bodies overwrite, 1.3-1.6 |
| Beautiful Bodies | 2068281501 | mireia.bodies | 99697 | Bodies overwrite, 1.0-1.7 |
| Erin's Body Retexture | 2662457442 | Erin.Body.Texture | 94262 | Bodies overwrite, subfolders .noabs and .bufffemaletexture |
| FemaleBB BodyType Support | 1792668502 | ssulunge.BBBodySupport | 84154 | compat bundle, 16 DLL, own paths: not a plain drop-in |
| Compatible Body 2 | 1906148376 | Nals.CompatibleBody2 | 59351 | Bodies overwrite, 1.3-1.5 tags |
| Malang Bodies | 2838181007 | plaxen.MalangBodies | 27304 | Bodies overwrite, 1.3-1.6 |
| ScrubDaddy's Bodies | 3537481455 | ScrubDaddy.Bodies | 20075 | Bodies overwrite, 1.6, compat 3666672471, Even More 3801930501 |
| UNAGI ZIBUNYOU BODY | 3243705173 | UNAGI.ZIBUNYOU.BODY | 17323 | Bodies + PerfectBody, 1.4-1.7 |

Also face packs added by the owner: VEFA (3753978140, sd.fa.movingvanillaeyes) and VTE face parts (see BACKLOG.md).

## PiI proposed lots (popularity and ease)

- Lot A: Realistic Body, Beautiful Bodies, Erin's, Compatible Body 2, Simple HD Bodies (3236876098, RedMattis.SimpleHDBodies, 44474), Malang.
- Lot B: [CP] Detailed Body Textures II (1501435493) and 1 (1842663024) and [RH2] 3 (2873235836), ScrubDaddy's, Sin's Bodies (2785957782), UNAGI body, IMOZOU Body (2645457599).
- Lot C: FemaleBodyVariants and Continued (same packageId, one only), JustBodies, [S16] Beautiful Body Variants, More Beautiful Bodies, Xeva Body Pack (last: own paths, 3 DLL).
- Lot D: racial or own path (Ratkin retextures, WDI).
- Lot E: low or dead (1.0-1.4), skip unless asked.

Not on the Workshop: ABCBodies 2, jjukbangnong, BeepBoop (A17), RimNudeWorld, Chiseled Body Addon, Sized Apparel Zero, Chanfana's Bodies, TREB's Body, Visible Pregnancy Belly Textures. Full small and old list: ask PiI.
