Feature: Karate Ramp-Up

Background:
    * url uiUrl
# --------- Frames ---------

Scenario: Frames 1
  Given driver uiUrl
  And maximize()
  When click('{}Alerts, Frame & Windows')
  And click('{}Frames')
  And switchFrame(1)
  And highlight('#sampleHeading')
  Then match text('#sampleHeading') == 'This is a sample page'
  * delay(t)

Scenario: Frames 2
  Given driver uiUrl
  And maximize()
  When click('{}Alerts, Frame & Windows')
  And click('{}Frames')
  And switchFrame(2)
  And highlight('#sampleHeading')
  Then match text('#sampleHeading') == 'This is a sample page'
  * delay(t)

# --------- Nested Frames ---------

Scenario: Nested Frames 1
  Given driver uiUrl
  And maximize()
  When click('{}Alerts, Frame & Windows')
  And click('{}Nested Frames')
  And switchFrame(1)
  And highlight('body')
  Then match text('body') == 'Parent frame'
  * delay(t*2)
  And highlight("//iframe[@srcdoc='<p>Child Iframe</p>']")
  And switchFrame("//iframe[@srcdoc='<p>Child Iframe</p>']")
  Then match text('{p}Child Iframe') == 'Child Iframe'
  * delay(t)