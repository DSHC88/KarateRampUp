Feature: Trabajando con los elementos de la UI

Background:
    * url uiUrl
    # Set-up del Navegador
    * configure driver = {type:'chromedriver', executable: 'src\\test\\java\\drivers\\chrome\\chromedriver.exe', webDriverSession: { capabilities: { browserName: 'chrome' } }}

Scenario: El usuario selecciona la opcion de Text Box y este diligencia los campos requeridos para presionar el boton submit.
    Given driver uiUrl
    And maximize()
    When click('{}Elements')
    And click('{}Text Box')
    # Diligenciar el formulario
    When input('#userName', 'Nombre completo de pruebas')
    Then match exists('{label}Full Name') == true
    And match value('#userName') == 'Nombre completo de pruebas'
    And match attribute('#userName', 'placeholder') == 'Full Name'
    # finalizacion de diligenciamiento
    When input('#userEmail', 'test@test.com')
    And input('#currentAddress', ['Calle Sal si puedes', Key.ENTER, 'con la Carrera El Hambre'])
    And input('#permanentAddress', 'Calle Super Mario Bros, edificio El tubo.', 250)
    # click en submit
    When click('{}Submit')
    # Validacion de informacion ingresada
    Then match text('#output') contains 'Nombre completo de pruebas'
    And match text('#output') contains any 'test@test.com'
    And match text('#output') contains  'Calle Sal si puedes'
    And match text('#output') contains any 'con la Carrera El Hambre'
    And match text('#output') contains  'Calle Super Mario Bros, edificio El tubo.'
    #And match text('#output') contains any 'Mariana'