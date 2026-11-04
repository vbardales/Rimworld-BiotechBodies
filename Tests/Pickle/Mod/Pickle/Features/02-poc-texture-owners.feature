@requires:nelim.pickletools.textureowner
Feature: POC, which running mod answers each contested pawn texture

  # Proof of concept (Tests/Poc/README.md). Paths shipped by two of the texture mods (read from the installed files
  # on 2026-11-04): the last running mod that ships a path wins (ContentFinder walks the running mods from the end).
  # One scenario per pass, tagged with the pass name and played with that pass map only. A failure names the winner
  # and lists every mod that ships the path in load order: that list is the finding, red or green.
  #   Naked_Thin_Female: WDI and Female Body Variants.  FurCovered_Male, Naked_Child: WDI and VTE.
  #   PerfectBody_Female: WDI and VRE Highmate.  Eyes/Normal/Female/normal: NL and the VTE bridge for NL.

  Background:
    Given the save "test-colony" is loaded

  @pass-wdi
  Scenario: WDI wins the female variant over Female Body Variants when it loads after it
    Then Nelim's Pickle Tools: the texture "Things/Pawn/Humanlike/Bodies/Naked_Thin_Female_south" is shipped by at least 2 running mods
    And Nelim's Pickle Tools: the texture "Things/Pawn/Humanlike/Bodies/Naked_Thin_Female_south" is answered by the mod "WDI.Realistic.Bodies"

  @pass-vtenl
  Scenario: the VTE bridge answers NL's eyes when it loads after NL
    Then Nelim's Pickle Tools: the texture "Things/Pawn/Humanlike/Eyes/Normal/Female/normal_south" is shipped by at least 2 running mods
    And Nelim's Pickle Tools: the texture "Things/Pawn/Humanlike/Eyes/Normal/Female/normal_south" is answered by the mod "VanillaExpanded.VTEXE.FacialAnims"

  # The two orders: one scenario per path, so a red path does not hide the next one.
  @pass-alla
  Scenario Outline: with WDI last, <path> is answered by <owner>
    Then Nelim's Pickle Tools: the texture "Things/Pawn/Humanlike/<path>_south" is answered by the mod "<owner>"

    Examples:
      | path                            | owner                             |
      | Bodies/Naked_Thin_Female        | WDI.Realistic.Bodies              |
      | Bodies/FurCovered_Male          | WDI.Realistic.Bodies              |
      | Bodies/Naked_Child              | WDI.Realistic.Bodies              |
      | PerfectBody/PerfectBody_Female  | WDI.Realistic.Bodies              |
      | Eyes/Normal/Female/normal       | VanillaExpanded.VTEXE.FacialAnims |

  @pass-allb
  Scenario Outline: with WDI first, <path> is answered by <owner>
    Then Nelim's Pickle Tools: the texture "Things/Pawn/Humanlike/<path>_south" is answered by the mod "<owner>"

    Examples:
      | path                            | owner                             |
      | Bodies/Naked_Thin_Female        | tiagocc0.FemaleBodyVariants       |
      | Bodies/FurCovered_Male          | VanillaExpanded.VTEXE             |
      | Bodies/Naked_Child              | VanillaExpanded.VTEXE             |
      | PerfectBody/PerfectBody_Female  | vanillaracesexpanded.highmate     |
      | Eyes/Normal/Female/normal       | VanillaExpanded.VTEXE.FacialAnims |
