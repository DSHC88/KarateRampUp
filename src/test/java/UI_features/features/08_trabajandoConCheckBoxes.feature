Feature: Karate Ramp-Up

Background:
  * url uiUrl2

Scenario: CheckBoxes
  Given driver uiUrl2
  And maximize()
  When waitFor('{h2}Available Examples')
  And click('{a}Checkboxes')
  Then waitFor('{h3}Checkboxes')
  When def listCheckBoxes = locateAll("//input[@type='checkbox']")
  When delay(t*2)
  When listCheckBoxes[0].click()
  When delay(t*2)
  When listCheckBoxes[1].click()
  When delay(t*2)
