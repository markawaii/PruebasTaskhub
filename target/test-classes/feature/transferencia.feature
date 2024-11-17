Feature: Realizar transferencia entre cuentas

  Background: 
    Given al navegar hasta la url "https://demo.testfire.net/"
    When hacemos click en el link "//*[@id='LoginLink']/font"
    And coloca en el campo usuario "//*[@id='uid']" el texto "jsmith"
    And coloca en el campo password "//*[@id='passw']" el texto "Demo1234"
    And hacer click sobre el boton Login "//*[@id='login']/table/tbody/tr[3]/td[2]/input"
    And hacer click en el link Transfer Funds "//*[@id='MenuHyperLink3']"
  
  Scenario: Realizar transferencia sin seleccionar la cuenta
    Given hacer click en el boton Transfer Money "//*[@id='transfer']"
    Then Presenta el mensaje de alerta "From Account and To Account fields cannot be the same."

  Scenario: Realizar transferencia correctamente
    And Indicar la cuenta de cargo en From Account "//*[@id='fromAccount']"  en "800002 Savings"
  	And Indica la cuenta beneficiaria en To Account "//*[@id='toAccount']" en  "800003 Checking"
    And Indicar monto a transferir en Amount TO to "//*[@id='transferAmount']" en "1000"
    And hacer click en el boton Transfer Money "//*[@id='transfer']"
    Then El mensaje de resultados "//*[@id='_ctl0__ctl0_Content_Main_postResp']/span" debe contener "1000.0 was successfully transferred"
