Feature: Karate Ramp-Up

Background:
    * url uiUrl

Scenario: Browser Windows 1
    Given driver uiUrl
    And maximize()
    When click('{}Alerts, Frame & Windows')
    * delay(t*3)
    And click('{}Browser Windows')
    * delay(t*3)
    And click('{}New Tab')
    * delay(t*3)
    And switchPage('demoqa.com/sample')
    * delay(t*3)
    Then match text('#sampleHeading') == 'This is a sample page'
    * delay(t*3)

  Scenario: Browser Windows 2
    Given driver uiUrl
    And maximize()
    * highlight('{}Alerts, Frame & Windows')
    When click('{}Alerts, Frame & Windows')
    * highlight('{}Browser Windows')
    And click('{}Browser Windows')
    * highlight('{}New Window')
    And click('{}New Window')
    And switchPage('demoqa.com/sample') 
    * highlight('#sampleHeading')
    Then match text('#sampleHeading') == 'This is a sample page'
    * delay(t)