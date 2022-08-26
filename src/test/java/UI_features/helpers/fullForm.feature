Feature: Diliegenciar Formulario
Scenario: Completar Form
  * def randomPhoneString = function(){var rand=Math.random(); return Math.floor(rand * 1000)}
  * def number = randomPhoneString()
  When input("//input[@id='customer.firstName']", 'Primer Nombre')
  When input("//input[@id='customer.lastName']", 'Apellido')
  When input("//input[@id='customer.address.street']", 'Calle siempre viva # 66-32')
  When input("//input[@id='customer.address.city']", 'Medayork')
  When input("//input[@id='customer.address.state']", 'Polombia')
  When input("//input[@id='customer.address.zipCode']", '050000')
  When input("//input[@id='customer.phoneNumber']", '3415848565')
  When input("//input[@id='customer.ssn']", 'No se que es')
  When input("//input[@id='customer.username']", 'example.test'+ number)
  When input("//input[@id='customer.password']", 'Cl4v3S3gur4')
  When input('#repeatedPassword', 'Cl4v3S3gur4')