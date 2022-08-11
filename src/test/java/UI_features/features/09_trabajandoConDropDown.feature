Feature: Karate Ramp-Up

Background:
  * url uiUrl2

Scenario: CheckBoxes
  Given driver uiUrl2
  And maximize()
  When waitFor('{h2}Available Examples')
  And click('{a}Dropdown')
  Then match text('{h3}Dropdown List') == 'Dropdown List'
  When highlight('#dropdown')
  * highlight('{}Please select an option')
  When select('#dropdown', 1)
  Then match attribute("//option[@value='1']", 'selected') == 'selected'
  * delay(t*2)
  When select('#dropdown', 2)
  Then match attribute("//option[@value='2']", 'selected') == 'selected'
  * delay(t*2)
