# Backlog

## Compat with Body Mod Mix and Match (Gulio.BodyModMixAndMatch, Workshop 3792365853)

Opened 2026-11-13 (Virginie). Today the mod is declared in `incompatibleWith` (About.xml): it replaces the body node per pawn without genes, so it overrides the look picked by a BiB gene.

Wanted for 1.7: let it run beside BiB. BiB would leave the body to Body Mod Mix and Match when the pawn holds no BiB gene, and keep the gene look when it does.

Steps:
- Read its code (which node, which patch, when it runs) and write down where the two patches meet.
- Pickle pass `Tests/Pickle/Mod/Pickle/Features/16-incompat-bmmam.feature` (map `wsl-deps.incompat-bmmam.map`) shows what happens today.
- If a clean order exists, patch it, add scenarios for a pawn with and without a gene, then drop `incompatibleWith`.
- Otherwise keep the declaration and re-play 16 each release (AUDIT: an incompatibility claim ages).
