Feature: Karate Ramp-Up

Background:
  * url bankUrl

Scenario: Demo Automation
  Given driver bankUrl
  And maximize()

  # Register UI
  When waitFor('{}Register').click()
  Then match text("//h1[@class='title']") == 'Signing up is easy!'
  # Diligenciar formulario
  * def customerInfo = call read('classpath:UI_features/helpers/fullForm.feature')
  When click("//*[@value='Register']")
  Then match text("//h1[@class='title']") == 'Welcome example.test'+ customerInfo.number

  # Valida la cuenta actual
  When click("//a[contains(text(),'Accounts Overview')]")
  Then match text("//h1[@class='title']") == 'Accounts Overview'
  * def accountOne = text("//a[@class='ng-binding']")
  # BE
  When url bankAPI + '/accounts/'+accountOne
  And method GET
  Then status 200
  * print response
  * print response.account.id
  * print response.account.customerId
  * print response.account.type
  * print response.account.balance

  #Abrir una cuenta Nueva
  When click("//a[contains(text(),'Open New Account')]")
  When highlight("//*[@value='Open New Account']")
  And click("//*[@value='Open New Account']")
  * def accountTwo = text("//a[@id='newAccountId']")
  Then match text("//h1[@class='title']") == 'Account Opened!'
  # BE
  When url bankAPI + '/accounts/'+accountTwo
  And method GET
  Then status 200
  * print response
  * print response.account.id
  * print response.account.customerId
  * print response.account.type
  * print response.account.balance

  # Transeferir de cuenta 1 to cuenta 2
  When click("//a[contains(text(),'Transfer Funds')]")
  And highlight('#amount')
  When input('#amount', '10')
  And select('#toAccountId', accountTwo)
  When click("//*[@value='Transfer']")
  And waitFor("//h1[contains(text(),'Transfer Complete!')]")
  Then match text("//h1[@class='title']") == 'Transfer Complete!'
    # BE
  When url bankAPI + '/accounts/'+accountOne
  And method GET
  Then status 200
  * print response
  * print response.account.id
  * print response.account.customerId
  * print response.account.type
  * def balanceOne = response.account.balance

  When url bankAPI + '/accounts/'+accountTwo
  And method GET
  Then status 200
  * print response
  * print response.account.id
  * print response.account.customerId
  * print response.account.type
  * def balanceTwo = response.account.balance


  # Validar Actividad de la cuenta
  When click("//a[contains(text(),'Accounts Overview')]")
  Then match text("//h1[@class='title']") == 'Accounts Overview'
  * highlight('{}'+accountOne)
  * highlight('{}'+accountTwo)
  * highlight('{}$'+balanceOne)
  * highlight('{}$'+balanceTwo)

  * delay(t*1)