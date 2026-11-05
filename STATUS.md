---
mod: Biotech Bodies
packageId: nelim.biotechbodies
repo: Rimworld-BiotechBodies
remote: https://github.com/vbardales/Rimworld-BiotechBodies.git
visibility: public
detached: yes
workflow_stage: makeSources
licence: original
licence_at: "2026-11-04: original mod by the owner, no source mod code reused"
upstream_mod_remotes: N/A
settings_audit: unchecked
localization: unchecked
translation_en: unchecked
translation_fr: unchecked
dependencies: unchecked
workshop: none
published: no
tested_on: never
remaining:
  - "2026-11-04: feature: layered look system by genes (slots: body, head, eyes, hair...; each slot has looks WDI, vanilla, VTE, NL...; resolution per slot: individual gene, race default only if the race mod is loaded, global default, vanilla; defaults in Mod options, global plus one section per loaded race; one look = one FurDef or render node + one exclusive gene; no gene per body type). Needs a Harmony render patch (C#), XML alone cannot do it."
  - "2026-11-04: unverified: FIRST a POC in Tests/Poc/ on texture mod coexistence (WDI, Female Body Variants, HD Pawn Textures, VTE vanillaexpanded.vtexe, VPPE, NL Facial Animation WIP Nals.FacialAnimation Workshop 1635901197, 1.0-1.6 only): one pawn per body type, each mod alone then combined in several load orders; look for overwritten textures, legless bodies, shifted eyes or head. Via Pickle tickets (TM queue was blocked by an AdaptiveStorage ticket)."
  - "2026-11-04: answered from installed files, not played (Tests/Poc/README.md): NL draws eyes, lids, brows and mouth as separate render nodes on a blank head; VTE draws no eyes, its eyes are the bridge 2816938779 that retextures NL's parts; perfect bodies = VRE Highmate gene VRE_PerfectBody through FurDef VRE_PerfectBody (not BodyTypeDef), WDI retextures its paths; Erin's 1.7 folder is byte-identical to 1.6, DLL has no render code; Female Body Variants Harmony-patches FurDef and body render paths."
  - "2026-11-04: Virginie's own need (owner, 2026-11-04): almost every pawn in WDI, 3 pawns back to vanilla. WDI ships textures only, under the vanilla paths, so a vanilla body cannot be reached by path while WDI loads: the 3 pawns need either a copy of the vanilla textures under a path of ours (XML gene + FurDef, redistributes Ludeon textures) or a small C# read of the base resources (no copy). WDI also ships apparel textures fitted to its bodies: a vanilla body under WDI apparel is to check. The POC narrows to the vanilla and wdi passes (tickets 8b94 vanilla, 7c3c wdi, on 7e325e9; they also prove the vanilla body loads from the base resources under WDI, steps PickleTools adb02ab); the 7 other passes are kept but not filed. Route chosen 2026-11-04: small C# (Resources.Load of the vanilla body, no texture copy), feasibility read in ContentFinder (Tests/Poc/README.md); code waits for the POC verdict. Results 2026-11-05: 8b94 vanilla exit 0 (11 passed, 4 skipped); 7c3c wdi exit 1 (18 passed, 1 failed, 4 skipped): Naked_Male, Female, Thin, Fat, Hulk load from base resources under WDI, Resources.Load of Naked_Child_south returns null (explained 2026-11-06 from the WSL 1.7 install, ~/rimworld17/Data: Naked_Child, Dessicated_Child and Naked_FurChild textures (north, east, south, .png.dds) sit in Data/Biotech/Assets.zip, the Biotech DLC content, not in the base resources; BodyTypes.xml of Biotech sets Juvenile bodyNakedGraphicPath Things/Pawn/Humanlike/Bodies/Naked_Child; so the child route must read the Biotech content through ContentFinder, not Resources.Load; the 1.6 layout is not checked); 4 perfect-body scenarios skipped (VRE not loaded). Evidence Tests/Pickle/Inbox/poc-vanilla and poc-wdi."
  - "2026-11-04: resolved by Audit on Virginie's delegation: HD Pawn Textures = HD Pawn Textures Continued (izarius, 3815495202, unofficial 1.6), not installed (Virginie to subscribe); second HD source to check: Vanilla Pawns Retextured (Neronix17, maybe neronix17.hd.pawns). VPPE resolved by assumption as VAPPE (VanillaExpanded.VAPPE, 1814987817, installed); no Workshop match for VPPE. Both now secondary to the need above."
  - "2026-11-04: POC suite written (Tests/Pickle, 9 pass maps wsl-deps.poc-*.map, features 01-poc-bodies, 02-poc-texture-owners); Mod/About/About.xml skeleton only, needed by the staging. Tickets filed, results pending."
  - "2026-11-04: feature: apparel base is VenusTouchWaistlines (nelim.venustouch.waistlines, TailorMade Harmony patch, WDI targets measured); also TailorMade, Thigappe. Not Body Mod Mix & Match (3792365853: random global pools, no gene, incompatible with Female Body Variants)."
  - "2026-11-05: 1.a duplicate search done (Search-Workshop.sh, About.xml names matching Body, Texture, Retextur, Skin: 56 hits, 3378 of 3426 folders read). No equivalent: closest is WDI Body Traits - Physiques and Shapes (3805486882, G2, beta, body by trait on Female Body Variants, no layered per-slot look, no gene, no per-race defaults); Body Mod Mix and Match (3792365853) already ruled out. Hits: /AppData/Local/Temp/rimworld-search/biotechbodies-dup/hits.txt."
updated: 2026-11-06
protocols_read_sha: e7962b483699dc1410dce4b1bdd34b6393c84454
---

# Biotech Bodies: status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.
Origin: asked by the owner on 2026-11-04 through RhyaethWdiRealisticBodiesPatch (RWDIRB), whose WDI patch (6 PatchOperationReplace, ticket 261c) stays there untouched. The GitHub repository is not created yet.
