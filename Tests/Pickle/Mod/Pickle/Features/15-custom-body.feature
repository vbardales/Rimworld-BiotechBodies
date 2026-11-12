@review @custom-body @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio
Feature: a gene of another mod with a BodyLookExtension draws its own body textures per body type

  # Asked by Creatures of Kikija (xenotype Kija, 2026-11-12). The test gene BiBTest_CustomBody (Tests/Pickle/Mod/Defs)
  # carries a BodyLookExtension: Thin is drawn with the Hulk texture, Hulk with the Thin texture, Male is not listed.
  # The body type stays the pawn's own. No texture mod is loaded, so the vanilla paths are the baseline.

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

  Scenario Outline: a <type> pawn with the custom body gene is drawn from <path>
    Given Nelim's Pickle Tools: a colonist "Kay" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Kay" gender is <gender>
    And Nelim's Pickle Tools: "Kay" body type is <type>
    And I destroy the gear of "Kay"
    And I wait 5 ticks
    And game speed is paused
    And Nelim's Pickle Tools: "Kay" faces South
    When Nelim's Pickle Tools: the camera is centered on "Kay" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "custom-before-<type>"
    And Nelim's Pickle Tools: "Kay" has the gene "BiBTest_CustomBody"
    And Nelim's Pickle Tools: "Kay" body type is <type>
    And I wait 5 ticks
    And game speed is paused
    Then Nelim's Pickle Tools: "Kay" holds the gene "BiBTest_CustomBody"
    And Nelim's Pickle Tools: "Kay" has body type <type>
    And Nelim's Pickle Tools: the body texture of "Kay" is logged
    And Nelim's Pickle Tools: the body of "Kay" is drawn from the texture path "<path>"
    And Nelim's Pickle Tools: "Kay" faces South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "custom-after-<type>"
    Then no errors were logged

    Examples:
      | type | gender | path                                    |
      | Thin | Female | Things/Pawn/Humanlike/Bodies/Naked_Hulk |
      | Hulk | Female | Things/Pawn/Humanlike/Bodies/Naked_Thin |
      | Male | Male   | Things/Pawn/Humanlike/Bodies/Naked_Male |
