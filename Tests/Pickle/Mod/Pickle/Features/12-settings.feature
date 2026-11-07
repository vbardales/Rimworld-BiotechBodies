# TESTING.md scenarios S1 to S4: the Mod options page of Biotech Bodies (MOD_SETTINGS.md section 4).
# The settings are sandboxed at their defaults, so the run leaves nothing in Config.
# S4 is played with a map that stages no WDI (wsl-deps.settings.map): a stored WDI choice must change nothing.
@settings @timeout:180 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.screenshotstudio
Feature: the Mod options page of Biotech Bodies

  Background:
    Given the save "test-colony" is loaded
    And game speed is paused
    And I close all dialogs
    And Nelim's Pickle Tools: the settings of the mod "nelim.biotechbodies" are sandboxed at their defaults

  Scenario: S1 the page exists, opens and closes with no error, for a person to look at
    Then Nelim's Pickle Tools: the mod options page of the mod "nelim.biotechbodies" exists
    When Nelim's Pickle Tools: I open the mod options page of the mod "nelim.biotechbodies"
    And Nelim's Pickle Tools: I let 10 frames pass
    And I take a screenshot "biotech bodies, mod options page"
    And Nelim's Pickle Tools: I close the mod options window
    Then no errors were logged

  Scenario: S2 a clean configuration holds the documented defaults
    Then Nelim's Pickle Tools: the option "globalBody" of the mod "nelim.biotechbodies" is "Auto"
    And Nelim's Pickle Tools: the option "globalFace" of the mod "nelim.biotechbodies" is ""
    And no errors were logged

  Scenario: S3 the choices are written to disk and read back as a restart would
    When Nelim's Pickle Tools: I set the option "globalBody" of the mod "nelim.biotechbodies" to "Vanilla"
    And Nelim's Pickle Tools: I set the entry "Human" of the option "raceBody" of the mod "nelim.biotechbodies" to "Vanilla"
    Then Nelim's Pickle Tools: the option "globalBody" of the mod "nelim.biotechbodies" is "Vanilla"
    And Nelim's Pickle Tools: the settings file of the mod "nelim.biotechbodies" holds "globalBody" as "Vanilla"
    When Nelim's Pickle Tools: the settings of the mod "nelim.biotechbodies" are re-read from the file
    Then Nelim's Pickle Tools: the option "globalBody" of the mod "nelim.biotechbodies" is "Vanilla"
    And Nelim's Pickle Tools: the entry "Human" of the option "raceBody" of the mod "nelim.biotechbodies" is "Vanilla"
    When Nelim's Pickle Tools: I set the option "globalBody" of the mod "nelim.biotechbodies" to "Auto"
    Then Nelim's Pickle Tools: the option "globalBody" of the mod "nelim.biotechbodies" is "Auto"
    And no errors were logged

  @nowdi
  Scenario: S4 a stored WDI choice changes nothing when WDI is not loaded
    Given Nelim's Pickle Tools: a colonist "Bo" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Bo" gender is male
    And Nelim's Pickle Tools: "Bo" body type is Male
    And I destroy the gear of "Bo"
    And I wait 5 ticks
    And game speed is paused
    When Nelim's Pickle Tools: I set the option "globalBody" of the mod "nelim.biotechbodies" to "Wdi"
    And Nelim's Pickle Tools: I let 10 frames pass
    Then Nelim's Pickle Tools: the body of "Bo" is not drawn from a texture path starting with "BiB/Wdi/"
    And Nelim's Pickle Tools: the body of "Bo" is not drawn from a texture path starting with "BiB/Vanilla/"
    And no errors were logged
