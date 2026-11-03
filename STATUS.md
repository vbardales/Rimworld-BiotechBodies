---
mod: Biotech Bodies
packageId: nelim.biotechbodies
repo: Rimworld-BiotechBodies
remote: https://github.com/vbardales/Rimworld-BiotechBodies.git
visibility: public
detached: yes
workflow_stage: setupRepo
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
  - "2026-11-04: unverified: how VTE and NL draw the eyes (head or separate node); whether perfect bodies go through FurDef or BodyTypeDef; Erin's 1.7 code not read."
  - "2026-11-04: feature: apparel base is VenusTouchWaistlines (nelim.venustouch.waistlines, TailorMade Harmony patch, WDI targets measured); also TailorMade, Thigappe. Not Body Mod Mix & Match (3792365853: random global pools, no gene, incompatible with Female Body Variants)."
updated: 2026-11-04
---

# Biotech Bodies: status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.
Origin: asked by the owner on 2026-11-04 through RhyaethWdiRealisticBodiesPatch (RWDIRB), whose WDI patch (6 PatchOperationReplace, ticket 261c) stays there untouched. The GitHub repository is not created yet.
