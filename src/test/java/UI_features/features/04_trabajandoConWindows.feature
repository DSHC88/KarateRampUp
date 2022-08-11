Feature: Karate Ramp-Up

Background:
    * url uiUrl

Scenario: Browser Windows 1
    Given driver uiUrl
    And maximize()
    When click('{}Alerts, Frame & Windows')
    And click('{}Browser Windows')
    And click('{}New Tab')
    And switchPage('demoqa.com/sample')
    Then match text('#sampleHeading') == 'This is a sample page'
    * delay(t)

Scenario: Browser Windows 2
    Given driver uiUrl
    And maximize()
    When click('{}Alerts, Frame & Windows')
    And click('{}Browser Windows')
    And click('{}New Window')
    And switchPage('demoqa.com/sample')
    Then match text('#sampleHeading') == 'This is a sample page'
    * delay(t)


