Feature: Visitar la pagina TOOLS QA.

  Background: Configuraciones iniciales antes de cada scenario
    * def t = 1000
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * url uiUrl
    # Set-up del Navegador
    * configure driver = {type:'chromedriver', executable: 'src\\test\\java\\drivers\\chrome\\chromedriver.exe', webDriverSession: { capabilities: { browserName: 'chrome' } }}

    Scenario: El usuario ingresa a la WEB y valida la URL y el titulo de la pesataña.

    Given driver uiUrl
    And driver.dimensions = {width:1000, height:1000}
    Then match driver.url == uiUrl +'/'
    And match driver.title == 'ToolsQA'