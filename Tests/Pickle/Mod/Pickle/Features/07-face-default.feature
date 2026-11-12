@review @face-default @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio
Feature: the face default of the Mod options gives a pawn with no gene the face parts of the UNAGI pack

  # A pawn with no gene at all is photographed close up before and after the Mod option: first the global default,
  # then the default of the race "Human" alone. The face parts of the pawn are logged each time; with the default set
  # they must come from the cloned UNAGI definitions (BiB_Unagi_) and their textures from BiB/Face/Unagi/.

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

  Scenario: the global face default reaches a pawn with no gene
    Given Nelim's Pickle Tools: the settings of the mod "nelim.biotechbodies" are sandboxed at their defaults
    And Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is male
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: the camera is centered on "Bo" at root size 2
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: the face parts of "Bo" are logged
    And I take a screenshot "facedefault-global-before"
    When Nelim's Pickle Tools: I set the option "globalFace" of the mod "nelim.biotechbodies" to "Unagi"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    And Nelim's Pickle Tools: I let 10 frames pass
    Then Nelim's Pickle Tools: the option "globalFace" of the mod "nelim.biotechbodies" is "Unagi"
    And Nelim's Pickle Tools: the face parts of "Bo" are logged
    And Nelim's Pickle Tools: the face Eyeball type of "Bo" starts with "BiB_Unagi_"
    And Nelim's Pickle Tools: the face Eyeball texture of "Bo" starts with "BiB/Face/Unagi/"
    And Nelim's Pickle Tools: the face Mouth type of "Bo" starts with "BiB_Unagi_"
    And I take a screenshot "facedefault-global-after"
    And no errors were logged

  Scenario: the face default of the race alone reaches a pawn with no gene
    Given Nelim's Pickle Tools: the settings of the mod "nelim.biotechbodies" are sandboxed at their defaults
    And Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is female
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: the camera is centered on "Bo" at root size 2
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: the face parts of "Bo" are logged
    And I take a screenshot "facedefault-race-before"
    When Nelim's Pickle Tools: I set the entry "Human" of the option "raceFace" of the mod "nelim.biotechbodies" to "Unagi"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    And Nelim's Pickle Tools: I let 10 frames pass
    Then Nelim's Pickle Tools: the entry "Human" of the option "raceFace" of the mod "nelim.biotechbodies" is "Unagi"
    And Nelim's Pickle Tools: the face parts of "Bo" are logged
    And Nelim's Pickle Tools: the face Eyeball type of "Bo" starts with "BiB_Unagi_"
    And Nelim's Pickle Tools: the face Mouth type of "Bo" starts with "BiB_Unagi_"
    And I take a screenshot "facedefault-race-after"
    And no errors were logged
