@review @neutral-gene @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio
Feature: a gender-neutral pawn with the gene BiB_VanillaBody shows the vanilla body under WDI's Realistic Bodies

  # Asked by SanctuaryBacklot (Quill Aster, Gender.None, 2026-11-07; the owner wants neutral pawns in the vanilla look).
  # WDI redraws the Male and Female bodies. This reads what a Gender.None pawn shows before and after the gene, on
  # every plain body type, face South and East so the head is seen too. The path assert says which body is drawn;
  # the pictures say how body and head look.

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

  Scenario Outline: an adult neutral pawn with the <type> body, before and after the gene
    Given Nelim's Pickle Tools: a colonist "Quill" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Quill" gender is neutral
    And Nelim's Pickle Tools: "Quill" body type is <type>
    And I destroy the gear of "Quill"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Quill" faces South
    When Nelim's Pickle Tools: the camera is centered on "Quill" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "neutral-wdi-<type>"
    And Nelim's Pickle Tools: the body texture of "Quill" is logged
    Then Nelim's Pickle Tools: the body of "Quill" is not drawn from a texture path starting with "BiB/Vanilla/"
    When Nelim's Pickle Tools: "Quill" has the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Quill" body type is <type>
    And I wait 5 ticks
    And game speed is paused
    Then Nelim's Pickle Tools: "Quill" holds the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Quill" has body type <type>
    And Nelim's Pickle Tools: the body texture of "Quill" is logged
    And Nelim's Pickle Tools: the body of "Quill" is drawn from the texture path "BiB/Vanilla/Things/Pawn/Humanlike/Bodies/Naked_<type>"
    And Nelim's Pickle Tools: "Quill" faces South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "neutral-vanilla-<type>"
    And Nelim's Pickle Tools: "Quill" faces East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "neutral-vanilla-<type>-east"
    Then no errors were logged

    Examples:
      | type   |
      | Thin   |
      | Male   |
      | Hulk   |
    # Female is not a row: a Gender.None pawn with the standard body gene always has the Male body type, so the step
    # "body type is Female" refuses it (ticket fa56). The pictures cover the three body types a neutral pawn can have.
