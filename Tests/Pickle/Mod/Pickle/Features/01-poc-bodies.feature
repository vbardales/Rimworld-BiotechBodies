@review @bodies @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio
Feature: POC, one naked pawn per body type under the texture mods of the pass

  # Proof of concept (Tests/Poc/README.md). The same scenarios are played in every pass; the pass map decides which
  # texture mods load and in what order. The assertions only say the state the picture shows (body type, no error);
  # overwritten textures, legless bodies and shifted eyes or head are read by eye on the captures, against the
  # vanilla pass. A green capture proves only that it was taken.
  # Each pawn is built fresh (kind Colonist, gear destroyed) so the body shows; the body type step comes after the
  # gender, since a gene change makes the game pick a body type again. Captures: whole body south and east, then the
  # head close up south and east (eyes, head position over the neck).

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

  Scenario Outline: an adult <gender> pawn with the <type> body
    Given Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is <gender>
    And Nelim's Pickle Tools: "Bo" body type is <type>
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    Then Nelim's Pickle Tools: "Bo" has body type <type>
    And Nelim's Pickle Tools: the genes of "Bo" are logged
    And Nelim's Pickle Tools: the fur nodes of "Bo" are logged
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: the camera is centered on "Bo" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "body-<gender>-<type>-south"
    And Nelim's Pickle Tools: "Bo" faces East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "body-<gender>-<type>-east"
    And Nelim's Pickle Tools: the camera frames the head of "Bo" at root size 1.5
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "head-<gender>-<type>-east"
    And Nelim's Pickle Tools: "Bo" faces South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "head-<gender>-<type>-south"
    Then no errors were logged

    Examples:
      | gender | type   |
      | male   | Male   |
      | female | Female |
      | male   | Thin   |
      | female | Thin   |
      | male   | Fat    |
      | female | Fat    |
      | male   | Hulk   |
      | female | Hulk   |

  Scenario Outline: a <gender> child
    Given Nelim's Pickle Tools: a colonist "Kid" of kind "Colonist" exists
    And "Kid" is 8 years old
    And Nelim's Pickle Tools: "Kid" gender is <gender>
    And Nelim's Pickle Tools: "Kid" body type is Child
    And I destroy the gear of "Kid"
    And I wait 5 ticks
    And game speed is paused
    Then Nelim's Pickle Tools: "Kid" has body type Child
    And Nelim's Pickle Tools: "Kid" faces South
    When Nelim's Pickle Tools: the camera is centered on "Kid" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "body-<gender>-Child-south"
    And Nelim's Pickle Tools: "Kid" faces East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "body-<gender>-Child-east"
    Then no errors were logged

    Examples:
      | gender |
      | male   |
      | female |

  # VRE Highmate's perfect body: a gene whose FurDef VRE_PerfectBody gives one path per body type. Its exclusion tags
  # (AG_Bodies, Bodies, Body) do not meet the body type genes (BodyType), so the gene is added after the body type.
  # The fur step tolerates a direction or _Female suffix (Female Body Variants reroutes FurDef paths).
  @requires:vanillaracesexpanded.highmate
  Scenario Outline: an adult <gender> pawn with the perfect body and the <type> body type
    Given Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is <gender>
    And Nelim's Pickle Tools: "Bo" body type is <type>
    And Nelim's Pickle Tools: "Bo" has the gene "VRE_PerfectBody"
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    Then Nelim's Pickle Tools: "Bo" has body type <type>
    And Nelim's Pickle Tools: "Bo" holds the gene "VRE_PerfectBody"
    And Nelim's Pickle Tools: the fur nodes of "Bo" are logged
    And Nelim's Pickle Tools: the fur of "Bo" is drawn from "Things/Pawn/Humanlike/PerfectBody/PerfectBody_<type>"
    And Nelim's Pickle Tools: "Bo" faces South
    When Nelim's Pickle Tools: the camera is centered on "Bo" at root size 3
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "perfect-<gender>-<type>-south"
    And Nelim's Pickle Tools: "Bo" faces East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "perfect-<gender>-<type>-east"
    Then no errors were logged

    Examples:
      | gender | type   |
      | male   | Male   |
      | female | Female |
      | female | Thin   |
      | male   | Hulk   |
