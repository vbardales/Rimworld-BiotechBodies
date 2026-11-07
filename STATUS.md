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
  - "face update 2026-11-07 (41df314): green after the fix: face-reel 42ae (1 passed), face-default c12c (2 passed; cause of 1162/bc66: Refresh called SetRandomFaceType on comps whose pawn is still null, now skipped). Tickets cf51 (nicefa), bf62 (retexture), 7e6d (unagi, recheck of the parts asserted) awaited; evidence of face-reel and face-default in Tests/Pickle/Inbox still to minify into Tests/Pickle/Evidence. Older note follows."
  - "face open 2026-11-07: Nice FA, Retexture, Reel scenarios (tickets 750b, e07c, ad17, then 2242, 9cf1, d3ff) failed: standard parts keep the original defs after the gene (scenarios now assert parts each pack defines: Head, Mouth). UNAGI 0539 green but all parts read BiB_Unagi_EmotionNormal (Emotion controller), so not proof. Cause found 2026-11-07: Harmony patched the shared generic NL code once per part type, so the per-type face default postfix ran for all types and wrote wrong-typed defs (everything read EmotionNormal). Fixed: FaceDefaults patches ControllerBaseComp.SetRandomFaceType once, fields read per instance; ParentName fix done; diag removed. Tickets 42ae (reel) and 1162 (face-default regression) awaited; then rerun nicefa and retexture, and recheck the UNAGI scenario assertions (old green was bogus). Older notes follow: face to do: (1) written 2026-11-07 (343f6a2): features 08 to 10 and maps wsl-deps.{nicefa,retexture,reel}.map for Nice FA 3302079637 (with stable NL, incompatible with Experimentals), FA Retexture 3271240549 (under UNAGI) and Reel 3118315633 (VFE Core, VTE, VTE-FA 2816938779; Reel's own dependencies unverified); tickets filed 750b (nicefa), e07c (retexture), ad17 (reel), results awaited; (2) covered by the same scenarios (default face is NL vanilla, gene pack differs; Nals.FacialAnimation id 1635901197 confirmed in wsl-ids.map); (3) done, played green 2026-11-07, ticket 20261106-221041-950-e6a1 (4ee492a, @face-default): 2 passed, evidence in Tests/Pickle/Inbox/face-default still to minify into Tests/Pickle/Evidence/face-default: Mod options default per race and global for the face (FaceDefaults.cs postfix on NL FaceTypeGenerator<T>.GetFaceTypeDefsForRaceWithGenes, BiBSettings.globalFace/raceFace, Face section of the Mod options); needs a ticket and an NPT step that sets a Mod option (ask NPT); (4) done 2026-11-07: About.xml loadAfter for NL (Nals.FacialAnimation, id from memory, to confirm against the Workshop item) and the four packs; (5) CHANGELOG section done; (6) NPT steps used: the face parts of X are logged, the face <Part> type/texture of X starts with (NPT, compiled by NPT 2026-11-06)."
  - "head and hair slots: WDI Realistic Bodies ships no head textures (Apparel, Bodies, PerfectBody only), so no WDI head look; head is covered by the face looks (HeadTypeDef). Hair slot not designed (hair path is per HairDef). Eyes: covered by the face looks (EyeballTypeDef) and by VTE-FA/NL; Body Mod Mix and Match (3792365853, Gulio.BodyModMixAndMatch) reads: it replaces PawnRenderNode_Body with random per-pawn pools and no gene, so it cannot run beside BiB for the same pawn; reusable ideas only (body mod catalog scan, per race+pack placement profiles)."
  - "build and release: 3.b build verified 2026-11-07 (dotnet build --no-incremental gives the same sha256 as the committed Mod/Assemblies/BiotechBodies.dll); CI/CD answered 2026-11-07: no build script wanted, the generator runs --build-project Source/BiotechBodies/BiotechBodies.csproj on the runner (3.b declared); 2.e/10.a: Preview rendered without echo, Render-Preview.cjs errors on ModIcon-source.png transparent padding (needs owner badge mode or a trimmed icon), echo and 10.d checks stay for mountPreview; panel.description of Art/Preview.config.json still a placeholder, to rewrite at mountPreview."
  - "dependencies and sources: apparel base VenusTouchWaistlines (nelim.venustouch.waistlines); Body Mod Mix and Match ruled out as base (see head and hair line). 1.a duplicate search done 2026-11-05: closest is WDI Body Traits (3805486882), no equivalent. HD Pawn Textures Continued (3815495202) not installed; second HD source Vanilla Pawns Retextured (Neronix17) to check, both secondary."
updated: 2026-11-07
protocols_read_sha: d2fe5947117627b98c44cc38fd00bfbd90725403
---

# Biotech Bodies: status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.
Origin: asked by the owner on 2026-11-04 through RhyaethWdiRealisticBodiesPatch (RWDIRB), whose WDI patch (6 PatchOperationReplace, ticket 261c) stays there untouched. The GitHub repository is not created yet.
