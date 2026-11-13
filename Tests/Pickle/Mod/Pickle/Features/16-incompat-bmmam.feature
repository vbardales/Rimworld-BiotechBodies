@incompat-bmmam @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio @requires:Gulio.BodyModMixAndMatch
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
