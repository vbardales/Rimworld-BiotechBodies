# Backlog

## Compat with Body Mod Mix and Match (Gulio.BodyModMixAndMatch, Workshop 3792365853)

Opened 2026-11-13 (Virginie). Today the mod is declared in `incompatibleWith` (About.xml): it replaces the body node per pawn without genes, so it overrides the look picked by a BiB gene.

Wanted for 1.7: let it run beside BiB. BiB would leave the body to Body Mod Mix and Match when the pawn holds no BiB gene, and keep the gene look when it does.

Steps:
- Read its code (which node, which patch, when it runs) and write down where the two patches meet.
- Pickle pass `Tests/Pickle/Mod/Pickle/Features/16-incompat-bmmam.feature` (map `wsl-deps.incompat-bmmam.map`) shows what happens today.
- If a clean order exists, patch it, add scenarios for a pawn with and without a gene, then drop `incompatibleWith`.
- Otherwise keep the declaration and re-play 16 each release (AUDIT: an incompatibility claim ages).

Pass 16 result (2026-11-13, ticket 717f, green, Tests/Pickle/Evidence/incompat-bmmam2): with Body Mod Mix and Match loaded, a pawn with the gene BiB_VanillaBody still draws `BiB/Vanilla/Things/Pawn/Humanlike/Bodies/Naked_Male` and the screenshot shows the vanilla body. The documented symptom (BMMaM overrides the gene look) is not reproduced for this case. Not yet played: a pawn without a gene (must keep the BMMaM body), other body types, other genes (WdiBody). The `incompatibleWith` declaration stays until the owner decides.

Pass 16 second result (2026-11-13, ticket 7195, green, Tests/Pickle/Evidence/incompat-bmmam3): pawn with no BiB gene draws `Things/Pawn/Humanlike/Bodies/Naked_Male` (the standard path, same body as the WdiBody pawn on screen); pawn with BiB_WdiBody draws `BiB/Wdi/...Naked_Male`. Body Mod Mix and Match changed nothing visible for the no-gene pawn, so the map has no body pack for it to pick from: the override BMMaM does is not exercised. Open question: add one body mod it supports to the map and replay, otherwise the incompatibility is neither proven nor disproven. `incompatibleWith` stays until the owner decides.

Pass 16 third result (2026-11-13, ticket 3443, green, map wsl-deps.incompat-bmmam-bb.map = Beautiful Bodies and WDI before BMMaM, Tests/Pickle/Evidence/incompat-bmmam4): same three paths as 7195 (gene BiB_VanillaBody: BiB/Vanilla/..., no gene: standard Naked_Male, BiB_WdiBody: BiB/Wdi/...). Cause read in BMMaM source (Source/AppearanceSettings.cs:163-186): `bodyPoolEnabled` is empty by default, a body mod joins a pool only when the player enables it in the BMMaM settings. So with default settings BMMaM changes nothing and BiB works beside it. Still unplayed: BMMaM with a pool enabled (needs a seeded BMMaM settings file or a Pickle step that writes it, then the three scenarios again).

Pass 16 fourth result (2026-11-13, ticket 8f01, green, seed config/incompat-bmmam-bb, evidence Inbox/incompat-bmmam5): same three paths again. The test cannot decide: Beautiful Bodies replaces the vanilla texture at the same path (`Things/Pawn/Humanlike/Bodies/Naked_Male`), and BMMaM's candidate for it is that same path, so the logged path is identical whether BMMaM acts or not. Nothing in Player.log shows the seed was read. Next design: a body pack with its own texture path (BMMaM "graphic" candidate with a different folder), or log the pool choice of the pawn (BMMaM `BodyPoolComponent`) by a local step, or compare screenshots against a pack that looks clearly different.
