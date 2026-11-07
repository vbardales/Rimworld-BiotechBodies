@review @face-nicefa @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio
Feature: the gene BiB_FaceNiceFA gives a pawn the face parts of the Nice Facial Animation pack

  # Nice FA covers Head, Lid, Brow, Skin and rare Eyeball types only (no Mouth, no common Eyeball), so Head is asserted.
  # The loaded default face is not this pack, so the gene must change the face. The same pawn is photographed close
  # up before and after the gene. The load log carries the number of part definitions cloned for the look
  # ([Biotech Bodies] face look NiceFA).

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

  Scenario: a female pawn, close up, before and after the face gene
    Given Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is female
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: the camera is centered on "Bo" at root size 1.5
    And Nelim's Pickle Tools: I let 10 frames pass
    And Nelim's Pickle Tools: the face parts of "Bo" are logged
    And I take a screenshot "face-default-NiceFA"
    When Nelim's Pickle Tools: "Bo" has the gene "BiB_FaceNiceFA"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    And Nelim's Pickle Tools: I let 10 frames pass
    Then Nelim's Pickle Tools: "Bo" holds the gene "BiB_FaceNiceFA"
    And Nelim's Pickle Tools: the face parts of "Bo" are logged
    And Nelim's Pickle Tools: the face Head type of "Bo" starts with "BiB_NiceFA_"
    And Nelim's Pickle Tools: the face Head texture of "Bo" starts with "BiB/Face/NiceFA/"
    And I take a screenshot "face-NiceFA"
    And no errors were logged
