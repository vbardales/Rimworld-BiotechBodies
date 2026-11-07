# TESTING.md scenarios S5 to S7: the hidden MainButtons shortcut BiB_Settings, driven through RIMMSQOL itself
# (steps of PickleTools/RimmsqolSteps). Played only by the pass avec-rimmsqol (wsl-deps.avec-rimmsqol.map).
# What no step can say yet: that the revealed button opens THIS mod's settings (a step "a settings dialog is open for
# the mod" does not exist in NPT, asked for); the opening is only captured, for a person to read.
@review @rimmsqol @requires:MalteSchulze.RIMMSqol @requires:nelim.pickletools.rimmsqol
Feature: RIMMSQOL reveals and hides the Biotech Bodies shortcut

  Background:
    Given the save "test-colony" is loaded
    And I close all dialogs
    Then mod "MalteSchulze.RIMMSqol" is loaded
    And RIMMSQOL is ready to be driven

  Scenario: S5 RIMMSQOL's own list offers the shortcut, hidden, and the bar does not draw it
    Then RIMMSQOL's own list of main buttons offers "BiB_Settings"
    And RIMMSQOL shows the main button "BiB_Settings" as hidden
    And RIMMSQOL holds no choice for the main button "BiB_Settings"
    And the main bar does not draw the button "BiB_Settings"

  Scenario: S6 revealed in RIMMSQOL the shortcut is drawn and opens a settings window without error
    When RIMMSQOL reveals the main button "BiB_Settings"
    Then RIMMSQOL shows the main button "BiB_Settings" as visible
    And RIMMSQOL's settings file records the main button "BiB_Settings" as visible
    And the main bar draws the button "BiB_Settings"
    When the main bar's button "BiB_Settings" is activated
    And I take a screenshot "biotech bodies settings, opened by the shortcut RIMMSQOL revealed"
    And I close all dialogs
    Then no errors were logged

  Scenario: S7 hidden again the shortcut leaves the bar, and forgetting the choice leaves nothing behind
    Given RIMMSQOL reveals the main button "BiB_Settings"
    And the main bar draws the button "BiB_Settings"
    When RIMMSQOL hides the main button "BiB_Settings"
    Then the main bar does not draw the button "BiB_Settings"
    And RIMMSQOL's settings file records the main button "BiB_Settings" as hidden
    When RIMMSQOL forgets its choice for the main button "BiB_Settings"
    Then RIMMSQOL holds no choice for the main button "BiB_Settings"
    And RIMMSQOL's settings file records no choice for the main button "BiB_Settings"
