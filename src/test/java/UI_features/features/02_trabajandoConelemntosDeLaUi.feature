Feature: Trabajando con los elementos de la UI

Background:
    * url uiUrl
    # Set-up del Navegador
    * configure driver = {type:'chromedriver', executable: 'src\\test\\java\\drivers\\chrome\\chromedriver.exe', webDriverSession: { capabilities: { browserName: 'chrome' } }}

Scenario: El usuario presiona click en la seccion Elements y es redirigido a una nueva ventana - Frendly locators
    Given driver uiUrl
    And maximize()
    When click('{}Elements')
    Then match driver.url == uiUrl + '/elements'
    And match text('{div:1}Elements') == 'Elements'
    * highlight('{div:1}Elements')
    And match text('{div:2}Elements') == 'Elements'
    * highlight('{div:2}Elements')

  Scenario: El usuario presiona click en la seccion Elements y es redirigido a una nueva ventana -Xpath locators
    Given driver uiUrl
    And maximize()
    When click("//h5[contains(text(),'Elements')]")
    Then match driver.url == uiUrl + '/elements'
    And match text("//div[@class='main-header']") == 'Elements'
      * highlight('{div:1}Elements')
    And match text("//div[contains(@class,'header-text')][contains(text(),'Elements')]") == 'Elements'
      * highlight('{div:2}Elements')