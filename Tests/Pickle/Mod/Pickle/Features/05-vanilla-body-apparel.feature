@review @vanilla-apparel @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio
Feature: apparel on a vanilla body under WDI's Realistic Bodies

  # WDI ships apparel textures fitted to its own bodies. A pawn with the gene BiB_VanillaBody wears the same garments
  # before and after the gene: the two pictures are read side by side for a gap, a clipping or a missing layer. The
  # drawn body path is asserted; how the garment sits on the body is decided by eye.

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

  Scenario Outline: a <gender> pawn with the <type> body wears a shirt and trousers, before and after the gene
    Given Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is <gender>
    And Nelim's Pickle Tools: "Bo" body type is <type>
    And I destroy the gear of "Bo"
    And I dress "Bo" in "Apparel_BasicShirt"
    And I dress "Bo" in "Apparel_Pants"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: the camera is centered on "Bo" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    Then "Bo" is wearing "Apparel_BasicShirt"
    And Nelim's Pickle Tools: the body of "Bo" is not drawn from a texture path starting with "BiB/Vanilla/"
    And I take a screenshot "wdi-dressed-<gender>-<type>"
    When Nelim's Pickle Tools: "Bo" has the gene "BiB_VanillaBody"
    And Nelim's Pickle Tools: "Bo" body type is <type>
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Bo" faces South
    And Nelim's Pickle Tools: I let 10 frames pass
    Then "Bo" is wearing "Apparel_BasicShirt"
    And Nelim's Pickle Tools: the body texture of "Bo" is logged
    And Nelim's Pickle Tools: the body of "Bo" is drawn from the texture path "BiB/Vanilla/Things/Pawn/Humanlike/Bodies/Naked_<type>"
    And I take a screenshot "vanilla-dressed-<gender>-<type>"
    And Nelim's Pickle Tools: "Bo" faces East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "vanilla-dressed-<gender>-<type>-east"
    And no errors were logged

    Examples:
      | gender | type   |
      | male   | Male   |
      | female | Female |
      | male   | Hulk   |
