# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it in game.

## [Unreleased]

### Added

- Gene `BiB_VanillaBody` (`Mod/Defs/GeneDefs_Looks.xml`): a pawn with it keeps the vanilla naked body even when a texture mod such as WDI redraws the vanilla paths. A Harmony postfix on `PawnRenderNode_Body.GraphicFor` builds the graphic from a prefixed path (`BiB/Vanilla/`), and a prefix on `ContentFinder<Texture2D>.Get` resolves that prefix from the official content only (Core, DLCs, base resources, asset bundles). No texture is copied.
- Repository skeleton and `Mod/About/About.xml`, now with Harmony and Biotech as dependencies and the load order after Female Body Variants and WDI's Realistic Bodies.
