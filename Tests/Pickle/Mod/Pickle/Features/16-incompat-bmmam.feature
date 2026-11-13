@incompat-bmmam @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio @requires:Gulio.BodyModMixAndMatch @requires:WDI.Realistic.Bodies
Feature: Body Mod Mix and Match is declared incompatible with Biotech Bodies, is it still true

  # About.xml lists Gulio.BodyModMixAndMatch in incompatibleWith (owner, 2026-11-13). Both mods replace the body node
  # of a pawn: Body Mod Mix and Match per pawn without genes, Biotech Bodies by gene. This pass mounts both and plays
  # the gene. First run: the body path is logged, the two pictures are read, then the documented symptom is asserted.

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)

  Scenario: a pawn with the gene BiB_VanillaBody next to Body Mod Mix and Match
    Given Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is Male
    And Nelim's Pickle Tools: "Bo" body type is Male
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: "Bo" has the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Bo" body type is Male
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: the camera is centered on "Bo" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "bmmam-gene-male"
    Then Nelim's Pickle Tools: "Bo" holds the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: the body texture of "Bo" is logged

  Scenario: a pawn with no BiB gene next to Body Mod Mix and Match
    Given Nelim's Pickle Tools: a colonist "Cy" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Cy" gender is Male
    And Nelim's Pickle Tools: "Cy" body type is Male
    And I destroy the gear of "Cy"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Cy" faces South
    And Nelim's Pickle Tools: the camera is centered on "Cy" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    When I take a screenshot "bmmam-nogene-male"
    Then Nelim's Pickle Tools: the body texture of "Cy" is logged

  Scenario: a pawn with the gene BiB_WdiBody next to Body Mod Mix and Match
    Given Nelim's Pickle Tools: a colonist "Wi" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Wi" gender is Male
    And Nelim's Pickle Tools: "Wi" body type is Male
    And I destroy the gear of "Wi"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Wi" faces South
    When Nelim's Pickle Tools: "Wi" has the gene "BiB_WdiBody"
    And Nelim's Pickle Tools: "Wi" body type is Male
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: the camera is centered on "Wi" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "bmmam-wdi-male"
    Then Nelim's Pickle Tools: "Wi" holds the gene "BiB_WdiBody"
    And Nelim's Pickle Tools: the body texture of "Wi" is logged
  # Pool test (owner idea, 2026-11-13). The seed config/incompat-bmmam-bb enables two Male bodies in the BMMaM pool (WDI and Beautiful Bodies),
  # so BMMaM has a real choice. BMMaM patches PawnRenderNode_Body.GraphicFor at Priority.Last, after BiB. Ten pawns with a BiB gene: all ten
  # log BiB/Vanilla/ means BiB wins and no incompatibility; any other path means BMMaM overrides the gene.
  Scenario Outline: pool pawn <n> with the gene BiB_VanillaBody next to Body Mod Mix and Match
    Given Nelim's Pickle Tools: a colonist "Gp<n>" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Gp<n>" gender is Male
    And Nelim's Pickle Tools: "Gp<n>" body type is Male
    And I destroy the gear of "Gp<n>"
    And I wait 5 ticks
    When Nelim's Pickle Tools: "Gp<n>" has the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Gp<n>" body type is Male
    And I wait 5 ticks
    Then Nelim's Pickle Tools: "Gp<n>" holds the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: the body texture of "Gp<n>" is logged

    Examples:
      | n  |
      | 1  |
      | 2  |
      | 3  |
      | 4  |
      | 5  |
      | 6  |
      | 7  |
      | 8  |
      | 9  |
      | 10 |

  # Control: pawns with no gene. If BMMaM acts, the screenshots show the two pool bodies (WDI anatomical, Beautiful Bodies), not the plain vanilla body.
  Scenario Outline: pool control pawn <n> with no gene next to Body Mod Mix and Match
    Given Nelim's Pickle Tools: a colonist "Np<n>" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Np<n>" gender is Male
    And Nelim's Pickle Tools: "Np<n>" body type is Male
    And I destroy the gear of "Np<n>"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Np<n>" faces South
    And Nelim's Pickle Tools: the camera is centered on "Np<n>" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    When I take a screenshot "pool-control-<n>"
    Then Nelim's Pickle Tools: the body texture of "Np<n>" is logged

    Examples:
      | n |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
# Incompatibility pass: Body Mod Mix and Match (Gulio.BodyModMixAndMatch) with Biotech Bodies.
# Humanoid Alien Races comes first: BMMaM patches AlienRace.AlienPawnRenderNode_BodyAddon without declaring it (PiI, RenderPatches.cs:209).
#   Submit-PickleRun.ps1 -Mod BiotechBodies -DepMap wsl-deps.incompat-bmmam.map -Filter '16-incompat-bmmam.feature::' -EvidenceDir Tests/Pickle/Inbox/incompat-bmmam
