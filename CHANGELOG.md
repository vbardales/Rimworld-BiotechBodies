# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it in game.

## [Unreleased]

### Added

- Gene `BiB_VanillaBody` (`Mod/Defs/GeneDefs_Looks.xml`): a pawn with it keeps the vanilla naked body even when a texture mod such as WDI redraws the vanilla paths. A Harmony postfix on `PawnRenderNode_Body.GraphicFor` builds the graphic from a prefixed path (`BiB/Vanilla/`), and a prefix on `ContentFinder<Texture2D>.Get` resolves that prefix from the official content only (Core, DLCs, base resources, asset bundles). No texture is copied.
- Gene `BiB_WdiBody` and the look WDI's Realistic Bodies for the body slot: the body textures come from the pack of WDI only (prefix `BiB/Wdi/`), whatever the load order and the defaults say, so a pawn can keep WDI when the default is Vanilla. Path taken from the graphic the game was going to draw (Female Body Variants carries over); a body WDI does not ship keeps the game's graphic. Without WDI the look changes nothing and is hidden in the Mod options.
- Mod options (`BiBSettings`, `BiBMod`): default body look for everyone and per humanlike race, Automatic (change nothing) or Vanilla. Resolution per pawn: look gene, race default, global default.
- Face slot, first look UNAGI: gene `BiB_FaceUnagi` gives a pawn the face of the UNAGI pack for Nal's Facial Animation (`UNAGI.FacialAnimation`). At startup `FaceLooks` reads the face part defs from the XML of that pack, clones them as `BiB_<Key>_<name>` with textures under `BiB/Face/<Key>/` and `targetGeneDefs` set to the look gene, and adds them to the def database; Facial Animation then picks them for pawns with the gene. Genes `BiB_FaceNiceFA` (Nice FA), `BiB_FaceRetexture` (FA Retexture) and `BiB_FaceReel` (Reel) exist the same way, each needing its pack. Facial Animation is reached by reflection and stays optional; each gene loads only with its pack (`MayRequire`).
- Repository skeleton and `Mod/About/About.xml`, now with Harmony and Biotech as dependencies and the load order after Female Body Variants and WDI's Realistic Bodies.
