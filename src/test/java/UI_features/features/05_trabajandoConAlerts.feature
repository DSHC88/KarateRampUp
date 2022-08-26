Feature: Karate Ramp-Up

Background:
    * url uiUrl
# --------- Alerts ---------

Scenario: Alerts 1
  Given driver uiUrl
  And maximize()
  * highlight('{}Alerts, Frame & Windows')
  When click('{}Alerts, Frame & Windows')
  * highlight('{}Alerts')
  And click('{}Alerts')
  * highlight('{button:1}Click me')
  And click('{button:1}Click me')
  * delay(t*2)
  And dialog(true)
  * delay(t)

Scenario: Alerts 2 - Wait 5 seconds
  Given driver uiUrl
  And maximize()
  When click('{}Alerts, Frame & Windows')
  And click('{}Alerts')
  And click('{button:2}Click me')
  * highlight('{button:2}Click me')
  And delay(t*4)
  And dialog(true)
  * delay(t)

Scenario: Alerts 3 - OK
  Given driver uiUrl
  And maximize()
  When click('{}Alerts, Frame & Windows')
  And click('{}Alerts')
  And click('{button:3}Click me')
  And dialog(true)
  * highlight('#confirmResult')
  Then match text('#confirmResult') == 'You selected Ok'
  * delay(t)

Scenario: Alerts 3 - Cancel
  Given driver uiUrl
  And maximize()
  When click('{}Alerts, Frame & Windows')
  And click('{}Alerts')
  And click('{button:3}Click me')
  And dialog(false)
  Then match text('#confirmResult') == 'You selected Cancel'
  * delay(t)

Scenario: Alerts 4 - Promt - Algun Texto
  Given driver uiUrl
  And maximize()
  When click('{}Alerts, Frame & Windows')
  And click('{}Alerts')
  And click('{button:4}Click me')
  And dialog(true, 'Algun Texto')
  Then match text('#promptResult') == 'You entered Algun Texto'
  Then match text('#promptResult') contains 'Algun Texto'
  * delay(t)

Scenario: Alerts 4 - Promt Cancel
  Given driver uiUrl
  And maximize()
  When click('{}Alerts, Frame & Windows')
  And click('{}Alerts')
  And click('{button:4}Click me')
  And dialog(false)
  Then match exists('#promptResult') == false
  * delay(t)
