---
mod: Biotech Bodies
packageId: nelim.biotechbodies
repo: Rimworld-BiotechBodies
remote: https://github.com/vbardales/Rimworld-BiotechBodies.git
visibility: public
detached: yes
workflow_stage: code[1.0.0]
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
  - "feature (owner, 2026-11-04/06): layered look system by genes. Slots body, head, eyes, hair; per slot looks (WDI, vanilla, VTE, FA packs...); resolution per slot: individual gene, race default (only if the race mod is loaded), global default, vanilla/Auto; defaults in Mod options (global plus one row per loaded race); one look = one exclusive gene; a pawn with no look gene shows vanilla, the mod changes nothing until a gene or a Mod option says so. Needs Harmony (C#). History in git (STATUS.md before 2026-11-06 compaction)."
  - "done, played green: BODY slot. Genes BiB_VanillaBody and BiB_WdiBody, Harmony postfix PawnRenderNode_Body.GraphicFor plus ContentFinder prefix BiB/Vanilla/ and BiB/Wdi/ (no texture copied, child body read from the Biotech content), Mod options global and per race (Auto, Vanilla, WDI). Tickets 8d8e (5 passed), 29a6 and 0287 (3 passed), 7e93 apparel under WDI (3 passed, no visible gap at root size 3). Evidence minified in Tests/Pickle/Evidence/{vanilla-gene,body-options,vanilla-apparel}."
  - "unproven: Female Body Variants load order. Map wdifirst (WDI before FBV) run 02a4 passed but the game re-sorted through loadAfter (Player.log lists FBV before WDI), so it is not a proof; the case may be impossible while About.xml declares loadAfter for both."
  - "done, played green: FACE slot, first look UNAGI. Source/BiotechBodies/FaceLooks.cs reads the face part defs from the XML of one NL Facial Animation pack (DirectXmlLoader, flat ParentName inheritance), clones them as BiB_<Key>_<name> with texPath prefixed BiB/Face/<Key>/ and targetGeneDefs = the look gene, adds them to the DefDatabase at startup; NL picks gene-targeted defs itself (FaceTypeGenerator, setting DrawFaceTypeForGenes). Genes BiB_FaceUnagi (UNAGI.FacialAnimation), BiB_FaceNiceFA (Andromeda.FacialAnimation), BiB_FaceRetexture (Barb.Facetexture), BiB_FaceReel (Reel.FacialAnims), MayRequire the pack. NL reached by reflection (optional). Ticket a659: exit 0, 2 passed (142 defs cloned, BiB_Unagi_* parts and BiB/Face/Unagi/ textures asserted, UNAGI face drawn). Evidence in Tests/Pickle/Evidence/face-unagi."
  - "face to do: (1) maps and scenarios for Nice FA 3302079637 (incompatible with NL Experimentals), FA Retexture 3271240549 (load under UNAGI) and Reel 3118315633 (needs VTE-FA 2816938779); (2) a scenario where the gene pack differs from the loaded default (UNAGI redefines the NL defs by defName, so with UNAGI loaded the before picture is already UNAGI; use Reel or Nice FA beside it); (3) Mod options default per race and global for the face; (4) About.xml loadAfter for the packs and NL; (5) CHANGELOG section; (6) NPT steps used: the face parts of X are logged, the face <Part> type/texture of X starts with (NPT, compiled by NPT 2026-11-06)."
  - "head and hair slots: WDI Realistic Bodies ships no head textures (Apparel, Bodies, PerfectBody only), so no WDI head look; head is covered by the face looks (HeadTypeDef). Hair slot not designed (hair path is per HairDef). Eyes: covered by the face looks (EyeballTypeDef) and by VTE-FA/NL; Body Mod Mix and Match (3792365853, Gulio.BodyModMixAndMatch) reads: it replaces PawnRenderNode_Body with random per-pawn pools and no gene, so it cannot run beside BiB for the same pawn; reusable ideas only (body mod catalog scan, per race+pack placement profiles)."
  - "build and release: 3.b build not verified (rebuild and compare Mod/Assemblies/BiotechBodies.dll with Source, declare build scripts to CI/CD); 2.e/10.a: Preview rendered without echo, Render-Preview.cjs errors on ModIcon-source.png transparent padding (needs owner badge mode or a trimmed icon), echo and 10.d checks stay for mountPreview; panel.description of Art/Preview.config.json still a placeholder, to rewrite at mountPreview."
  - "dependencies and sources: apparel base VenusTouchWaistlines (nelim.venustouch.waistlines); Body Mod Mix and Match ruled out as base (see head and hair line). 1.a duplicate search done 2026-11-05: closest is WDI Body Traits (3805486882), no equivalent. HD Pawn Textures Continued (3815495202) not installed; second HD source Vanilla Pawns Retextured (Neronix17) to check, both secondary."
updated: 2026-11-06
protocols_read_sha: 9864a34e5e3f6bc06d2dd8763017d86be725880e
---

# Biotech Bodies: status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.
Origin: asked by the owner on 2026-11-04 through RhyaethWdiRealisticBodiesPatch (RWDIRB), whose WDI patch (6 PatchOperationReplace, ticket 261c) stays there untouched. The GitHub repository is not created yet.
