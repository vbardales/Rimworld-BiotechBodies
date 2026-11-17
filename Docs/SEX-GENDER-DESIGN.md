# Sex and gender in Biotech Bodies: design draft

Status: draft v2, 2026-11-17, ships in 1.1.0. Origin: owner decision relayed by SanctuaryBacklot (SaB): sex and gender work is an extension of BiB. Nothing is built. Points marked (verify) are not read in the game code yet.

## Owner model (2026-11-17, in the BiB chat)

- **Gender** is what the pawn profile shows ("femme, 23 ans, ..."). Neutral gender shows "humain, 23 ans, ...". So `Pawn.gender == Gender.None` means NEUTRAL GENDER. No separate storage for gender: the vanilla field is the gender.
- **Sex** is biological and genetic: a gene, `BiB_SexMale` or `BiB_SexFemale` (names validated by the owner 2026-11-17). Exactly one per humanlike pawn.

This replaces draft v1 (binary `Pawn.gender` plus a Neutral comp, gene, hediff or trait). The storage question of v1 is closed.

## Problem (proved by SaB, `SanctuaryBacklot/Docs/NEUTRES-TETE.md`)

A `Gender.None` humanlike pawn draws its head too low. Not the head shape, not `BiB_VanillaBody`, not the body type, not RJW, not Non-Binary Gender. The game picks body `Female` and head `Male_NarrowWide` for it, and no head def has gender `None`. Vanilla reads `pawn.gender` for biology; with a neutral gender those reads are wrong or missing.

## Design

1. **Sex gene** drives everything biological that vanilla takes from `pawn.gender`: body type pool, head type pool, hair pool, organs and reproduction, apparel and style gender filters. BiB redirects those reads to the sex gene when `pawn.gender` is `None` (and may do it for all pawns for one code path).
2. **Gender** stays in `Pawn.gender` and drives only what the player reads: profile label, pronouns, text. The profile label for `None` becomes "humain" (English wording to decide). (verify the label call and the pronoun lookup for `None`).
3. **Look** stays separate: look genes (`BiB_VanillaBody`, `BiB_WdiBody`, face packs) resolve per slot, free of sex and gender.

## Where the random draw plugs in

- Sex: drawn once at creation, random binary, written as the sex gene. Harmony hook at generation (verify the overload; candidate `PawnGenerator.GeneratePawn(PawnGenerationRequest)` and the gene generation step). A pawn with a vanilla gender Male or Female gets the matching sex gene by default.
- Gender: vanilla draw gives Male or Female; Neutral is set by a request (`FixedGender None`), a scenario step, or a BiB dev gizmo. BiB must stop vanilla from overwriting `None`.
- Load: nothing. Saved sex gene and saved `Pawn.gender` are never rewritten.
- Existing `Gender.None` pawns in a save get a sex gene at first load only if missing, one time, then fixed (open question 5).

## Work this implies (the large part)

Every vanilla read of `pawn.gender` that stands for biology must be found and redirected: PawnGenerator (body type, head, hair, organs), `PawnRenderNode` head and body graphics, hair and beard filters, `BodyTypeDef` gender rules, apparel and style filters, reproduction and pregnancy. Compat patches read `pawn.gender` too (Facial Animation, WDI, Female Body Variants): they need the same redirect or a test that they cope with `None`. A reflection or transpiler pass plus a Pickle proof per area. Not a small patch.

## Compatibility to check (verify)

- Way Better Romance, RJW, rjw-genes: sex and orientation; they read `pawn.gender` and may break on `None`. Non-Binary Gender (3109763692): same field, likely incompatible.
- Female Body Variants, WDI Realistic Bodies, Facial Animation: render on `pawn.gender`; test with `None` and a sex gene.
- Biotech xenogerm and gene inheritance: decide that child sex is drawn at birth, not inherited, so the sex gene never breaks a child.

## Pickle

Owner spec (2026-11-17, BiB chat and SaB relay). (1) `"X" sex is male|female` sets the SEX gene only (BiB_SexMale or BiB_SexFemale, removes the other). (2) `"X" gender is male|female|neutral` sets `Pawn.gender`; for male or female it also sets the sex gene to the same value, so a normal pawn needs ONE `gender is` step (what every current test does). (3) `gender is neutral` sets `Pawn.gender = None` and does not touch an existing sex gene; if the pawn has no sex gene yet it draws one at random (BiB chat rule), and the draw is logged. So a neutral pawn such as Quill is `sex is male` then `gender is neutral`. (4) A gender different from the sex needs the sex step AFTER the gender step. Needs from PiT (BiB writes no local step): the `sex is` step, the extended `gender is` rule, a probe and a log line that prints the sex gene and the drawn sex. Until the sex gene exists (1.1.0), `gender is male|female` is the binary workaround and SaB keeps it.

## Open questions (owner)

1. Names of the sex genes: DONE, BiB_SexMale and BiB_SexFemale (owner 2026-11-17). Still open: the Neutral profile word in English and French (Virginie decides, `Docs/review-names.md`).
2. Neutral profile word: "humain" in French; English "human"?
3. Can gender differ from sex for Male or Female genders (a woman with the male sex gene)? Assumed yes: sex is biology, gender is identity.
4. Romance: not decided ("je ne sais pas encore"); untouched meanwhile.
5. Existing `Gender.None` pawns in her saves: give them a sex gene at first load, or leave them? SaB has only throw-away test pawns.
6. Until a 1.1.0 build exists, SaB scenarios use binary gender (Quill and Quaren male, Quo female).
