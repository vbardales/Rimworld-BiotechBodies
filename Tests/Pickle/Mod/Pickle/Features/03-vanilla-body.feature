@review @vanilla-gene @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio
Feature: the gene BiB_VanillaBody keeps the vanilla body under WDI's Realistic Bodies

  # WDI redraws every vanilla body path. A pawn with the gene must show the vanilla body, a pawn without it the WDI
  # body. Each scenario captures the same pawn twice, before and after the gene, so the two pictures are read side by
  # side. A green capture proves only that it was taken; the pictures decide. No step reads the drawn graphic path
  # yet: the fur nodes are logged as a trace and a step is to be asked of PickleTools.

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

  Scenario Outline: an adult <gender> pawn with the <type> body, before and after the gene
    Given Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is <gender>
    And Nelim's Pickle Tools: "Bo" body type is <type>
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: the camera is centered on "Bo" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "wdi-<gender>-<type>"
    When Nelim's Pickle Tools: "Bo" has the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Bo" body type is <type>
    And I wait 5 ticks
    And game speed is paused
    Then Nelim's Pickle Tools: "Bo" holds the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Bo" has body type <type>
    And Nelim's Pickle Tools: the fur nodes of "Bo" are logged
    And Nelim's Pickle Tools: "Bo" faces South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "vanilla-<gender>-<type>"
    And Nelim's Pickle Tools: "Bo" faces East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "vanilla-<gender>-<type>-east"
    Then no errors were logged

    Examples:
      | gender | type   |
      | male   | Male   |
      | female | Female |
      | female | Thin   |
      | male   | Hulk   |

  Scenario: a child with the gene shows the vanilla child body, from the Biotech content
    Given Nelim's Pickle Tools: a colonist "Kid" of kind "Colonist" exists
    And "Kid" is 8 years old
    And Nelim's Pickle Tools: "Kid" gender is female
    And Nelim's Pickle Tools: "Kid" body type is Child
    And I destroy the gear of "Kid"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Kid" faces South
    When Nelim's Pickle Tools: the camera is centered on "Kid" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "wdi-female-Child"
    When Nelim's Pickle Tools: "Kid" has the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Kid" body type is Child
    And I wait 5 ticks
    And game speed is paused
    Then Nelim's Pickle Tools: "Kid" holds the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Kid" has body type Child
    And Nelim's Pickle Tools: "Kid" faces South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "vanilla-female-Child"
    Then no errors were logged
