# Sex and gender in Biotech Bodies: design draft

Status: draft, 2026-11-17. Origin: owner decision relayed by SanctuaryBacklot (SaB) through the TM: sex and gender work is an extension of BiB, not a new mod. Nothing is built. Points marked (verify) are not read in the game code yet.

## Problem (proved by SaB, `SanctuaryBacklot/Docs/NEUTRES-TETE.md`)

A `Gender.None` humanlike pawn draws its head too low. Not the head shape, not `BiB_VanillaBody`, not the body type, not RJW, not Non-Binary Gender. Male and female controls draw correctly. The game picks body `Female` and head `Male_NarrowWide` for a neutral pawn, and no head def has gender `None`.

## Design in three separate things

1. **Sex** (game side): `Pawn.gender` stays `Male` or `Female` for every humanlike pawn. It is drawn at random once, at creation, by the vanilla generator. It fixes organs, body type and head pool before any surgery. BiB never changes it and never writes it at load.
2. **Gender identity** (BiB side): "Neutral" is a gene, `BiB_GenderNeutral` (name open). It changes labels and pronouns only. It does not touch `Pawn.gender`, so the render pipeline never sees `None`. This also removes the head offset for Quill, Quo and Quaren, because their sex is binary.
3. **Look**: already separate from sex. Body and face looks are genes resolved per slot (`BiB_VanillaBody`, `BiB_WdiBody`, face packs). A neutral pawn picks any look. A head slot is possible later (not in 1.0.0 scope, `STATUS.md` design line).

## Where the random draw plugs in

- The vanilla draw already gives a binary sex to normal pawns. BiB adds nothing for them.
- Only requests with `FixedGender == Gender.None` need BiB: Harmony prefix on `PawnGenerator.GeneratePawn(PawnGenerationRequest)` (verify the exact overload) sets `request.FixedGender` to a random binary value, once, at generation. Before generation, because organs, body type, head and hair are chosen from the gender during generation: a fix after the fact would be late.
- Load: nothing. `ExposeData` is untouched, so a saved sex never changes.
- Existing saves with a `Gender.None` humanlike pawn: leave them alone in 1.0 (verify how many cases exist: scenario starts with a neutral pawn, mods). Option for later: a one-time repair button, owner decision.

## What Neutral changes in game

- Gene label and description in the gene tab.
- Pronouns and gendered words in text: patch the pronoun lookup for carriers (they/them) (verify the call: `GenderUtility` and grammar request).
- Not changed: organs, body type, head pool, romance and orientation, pregnancy. Romance stays on binary sex in 1.0.0.
- Inheritance: vanilla random sex for a child; the Neutral gene follows normal gene inheritance (germline).

## Why a gene, not a trait or a hediff

A gene shows in the genes tab, passes to children, can be given by xenotype or by Pickle step, and BiB already carries look genes. A trait would compete with Way Better Romance orientation traits. A hediff is lost on revive or rebirth.

## Compatibility to check (verify)

- Way Better Romance: declares Non-Binary Gender incompatible; check its gender and orientation genes and traits before naming ours.
- RJW and rjw-genes: sex and orientation handling; no overlap if BiB only reads `Pawn.gender`.
- Non-Binary Gender (3109763692): different mechanism (`Gender.None` side), likely incompatible with the draw prefix; decide `incompatibleWith` after a test.
- Female Body Variants, WDI Realistic Bodies, Facial Animation: render on binary sex, nothing to change.

## Pickle

PiT already ships `sex` steps in ColonistRace (`"X" sex is male|female|neutre`, `the sex of "X" is ...`, `... is written to the log`). BiB needs: a step or existing gene step to give `BiB_GenderNeutral`, and a probe that the pawn reads Neutral with a binary `Pawn.gender`. Ask PiT through the TM before writing any local step. Stability test: create a pawn, save, reload several times, same sex each time (SaB f090 could not test it, no random creation yet).

## Open questions (owner, via SaB)

1. Answered 2026-11-17 by the owner (Virginie, in the BiB session chat): ships in 1.1.0. The 1.0.0 scope stays closed (2026-11-07).
2. Gene name and wording in English and French (Virginie decides, `Docs/review-names.md`).
3. Does Neutral change romance (orientation) in 1.0, or labels and pronouns only?
4. Existing `Gender.None` pawns in a save: leave them or repair them?
5. Until then SaB scenarios use binary sex (Quill and Quaren male, Quo female), as the TM brief says.
