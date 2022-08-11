Feature: Karate Ramp-Up

Background:
  * url uiUrl2

Scenario: Add/remove Elements
  Given driver uiUrl2
  And maximize()
  When waitFor('{h2}Available Examples')
  And click('{a}Add/Remove Elements')
  Then match text('{h3}Add/Remove Elements') == 'Add/Remove Elements'
  When click('{button}Add Element')
  Then waitFor('{}Delete')
  When click('{}Delete')
  Then match exists('{button}Delete') == false


