# Proof of concept: texture mod coexistence

Question: can the pawn texture mods Biotech Bodies wants to offer as "looks" (WDI's Realistic Bodies, Female Body
Variants, VTE, [NL] Facial Animation, VRE Highmate's perfect body; HD Pawn Textures and "VPPE" still to identify)
run side by side, alone and combined, without overwritten textures, legless bodies, or shifted eyes or head?
No mod code is written before the verdict of this POC (owner, 2026-11-04).

The game is played by Pickle through tickets. The staging requires the suite in `Tests/Pickle/` and the mod's
`Mod/About/About.xml`, so the scenarios live there; this folder holds the plan, the static findings and the verdict.

## Passes

One ticket per pass. Each pass map (`Tests/Pickle/wsl-deps.poc-<pass>.map`) lists the mods in load order: the
staging writes `activeMods` in map order, and Biotech Bodies (empty, About.xml only) loads after them.

| Pass | Mods, in load order |
|---|---|
| `vanilla` | none (baseline) |
| `fbv` | Female Body Variants |
| `wdi` | Female Body Variants, WDI |
| `vte` | VEF, VTE |
| `nl` | NL |
| `vtenl` | VEF, VTE, NL, VTE bridge for NL (`VanillaExpanded.VTEXE.FacialAnims`, 2816938779) |
| `highmate` | VEF, VRE Highmate |
| `alla` | VEF, Female Body Variants, NL, VTE, VTE bridge, VRE Highmate, WDI (WDI last, as its loadAfter asks) |
| `allb` | VEF, WDI, VTE, VRE Highmate, NL, VTE bridge, Female Body Variants (WDI first) |

Each pass plays `01-poc-bodies.feature` (naked pawn: eight adult rows, Male, Female, Thin, Fat, Hulk by gender, and
two children; body south and east, head close up south and east; plus four perfect body rows where VRE Highmate
loads) and the scenarios of `02-poc-texture-owners.feature` tagged with its pass name (which mod answers each path
two mods ship). Filter: `-Filter '@bodies,@pass-<pass>'`.

Read by eye, against the `vanilla` pass: overwritten textures (a body from the wrong mod), legless or cut bodies,
eyes or head off the face or neck. The feature only asserts the body type, the fur path of the perfect body and a
clean log.

## Static findings (installed files, 2026-11-04; not played)

- **WDI's Realistic Bodies** (3527486510) ships no Def and no DLL: textures only, under the vanilla paths
  (`Things/Pawn/Humanlike/Bodies/Naked_*`, the Biotech skins `BarkSkin_*`, `FurCovered_*`, `Insectskin_*`,
  `Pawn/ScalySkin`, `Pawn/SyntheticSkin`) and under `Things/Pawn/Humanlike/PerfectBody/`. It wins by load order only.
- **Perfect bodies go through a FurDef.** They are VRE Highmate's (2995385834, `vanillaracesexpanded.highmate`):
  gene `VRE_PerfectBody` (exclusion tags `AG_Bodies`, `Bodies`, `Body`), `graphicData/fur` = FurDef `VRE_PerfectBody`,
  whose `bodyTypeGraphicPaths` gives one path per body type (`PerfectBody_<type>`, Child and Baby on `Naked_Child`).
  Not a BodyTypeDef. WDI retextures those paths.
- **Female Body Variants** (3798082132) is a Harmony mod: it patches `FurDef.GetFurBodyGraphicPath`,
  `PawnRenderNode_Body.GraphicFor`, `PawnRenderNode.TexPathFor` and the Anomaly, creepjoiner and mutant body paths
  to use a `_Female` variant when one exists; it ships `Naked_Thin/Fat/Hulk_Female`. A render patch of Biotech
  Bodies must coexist with these patches.
- **VTE** (2016436324) does not draw the eyes. It retextures only the `FurCovered_*` heads and bodies,
  `Naked_Child` and `Naked_FurChild` among pawn textures (the rest is apparel, attachments, tattoos). VTE eyes come
  from the bridge 2816938779, which retextures NL's face parts (`Eyes`, `Brows`... under NL's paths); its
  `loadFolders.xml` stops at v1.4, so 1.6 reads the v1.4 entry (root only).
- **NL draws the eyes as separate nodes on a blank head.** NL (1635901197, 1.0 to 1.6) adds comps to `Human`
  (`DrawFaceGraphicsComp`, `HeadControllerComp`, `EyeballControllerComp`, lid, brow, mouth, skin controllers),
  swaps the head for `Things/Pawn/Humanlike/Heads_Blank/<shape>` and draws eyes, lids, brows and mouth as render nodes
  of its own (`PawnRenderNodeProperties_Eye`, `CompRenderNodes` in its DLL). Read from type names, not decompiled.
- **Erin's 1.7 code is the 1.6 code.** In Erin's Rhy'aeth (3707527452) every file of `1.7/` is byte-identical to
  `1.6/` (19 files; `ErinsRhyaeth.dll` sha1 `e3775f12...` in both). The DLL holds no render code: a metal eating
  job, a room size need patch, a dragon instincts gene. The body is the FurDef `ERN_RhyaethBody` (XML).

## Verdict

Pending the tickets.

## The owner's need and the chosen route (2026-11-04)

Almost every pawn in WDI, 3 pawns back to the vanilla body. Route chosen by Virginie: a small C# (no copy of the
Ludeon textures). Feasibility, read in the 1.6 `Assembly-CSharp.dll` (ilspycmd, `Verse.ContentFinder<T>.Get`): the
running mods are asked from the last one down, then `Resources.Load<Texture2D>("Textures/" + path)`, then the mod asset
bundles. `Data/Core` holds no `Textures/` folder, so the vanilla body exists only in the base resources, and
`Resources.Load` reaches it whatever WDI ships at the same path. Sketch (not written before the verdict): a gene
`BiB_VanillaBody`; a Harmony postfix on `PawnRenderNode_Body.GraphicFor`, ordered after Female Body Variants' patch,
that gives a pawn with the gene a graphic whose textures come from `Resources.Load` (a `Graphic_Multi` subclass, since
`Graphic_Multi.Init` goes through `ContentFinder`). Open: WDI's apparel textures fitted to its bodies, worn on a
vanilla body.
