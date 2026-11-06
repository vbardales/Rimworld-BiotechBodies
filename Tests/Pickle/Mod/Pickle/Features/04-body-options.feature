@review @body-options @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio
Feature: the Mod options give the body look of pawns that carry no gene

  # Without a gene and without an option, the body is the one WDI draws. The option "globalBody" (everyone) and the
  # entry of "raceBody" (one race) each switch the pawn to the vanilla body, with no gene. The settings are
  # sandboxed, so the run leaves nothing in Config.

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs
    And Nelim's Pickle Tools: the settings of the mod "nelim.biotechbodies" are sandboxed at their defaults
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)

  Scenario: the default for everyone gives the vanilla body to a pawn with no gene
    Given Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is male
    And Nelim's Pickle Tools: "Bo" body type is Male
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: the camera is centered on "Bo" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: the option "globalBody" of the mod "nelim.biotechbodies" is "Auto"
    And Nelim's Pickle Tools: the body of "Bo" is not drawn from a texture path starting with "BiB/Vanilla/"
    When Nelim's Pickle Tools: I set the option "globalBody" of the mod "nelim.biotechbodies" to "Vanilla"
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: the body texture of "Bo" is logged
    And Nelim's Pickle Tools: the body of "Bo" is drawn from the texture path "BiB/Vanilla/Things/Pawn/Humanlike/Bodies/Naked_Male"
    And I take a screenshot "global-vanilla-male-Male"
    When Nelim's Pickle Tools: I set the option "globalBody" of the mod "nelim.biotechbodies" to "Auto"
    And Nelim's Pickle Tools: I let 10 frames pass
    Then Nelim's Pickle Tools: the body of "Bo" is not drawn from a texture path starting with "BiB/Vanilla/"
    And no errors were logged

  Scenario: the default of one race gives the vanilla body to a pawn of that race
    Given Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is female
    And Nelim's Pickle Tools: "Bo" body type is Female
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: the camera is centered on "Bo" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    Then Nelim's Pickle Tools: the body of "Bo" is not drawn from a texture path starting with "BiB/Vanilla/"
    When Nelim's Pickle Tools: I set the entry "Human" of the option "raceBody" of the mod "nelim.biotechbodies" to "Vanilla"
    And Nelim's Pickle Tools: I let 10 frames pass
    Then Nelim's Pickle Tools: the entry "Human" of the option "raceBody" of the mod "nelim.biotechbodies" is "Vanilla"
    And Nelim's Pickle Tools: the body texture of "Bo" is logged
    And Nelim's Pickle Tools: the body of "Bo" is drawn from the texture path "BiB/Vanilla/Things/Pawn/Humanlike/Bodies/Naked_Female"
    And I take a screenshot "race-vanilla-female-Female"
    And no errors were logged
