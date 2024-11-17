Feature: Inicio de sesión de usuario

  Scenario: Inicio de sesión exitoso con correo y contraseña correctos
    Given navego a la URL "https://taskhub.cl/"
    When ingreso en el campo de nombre de usuario con id "email" el texto "igna.veliz@duocuc.cl"
    And ingreso en el campo de contraseña con id "password" el texto "123123123"
    And hago clic en el botón de inicio de sesión con id "login_button"
    Then debería ser redirigido a la URL "https://taskhub.cl/inicio"

  Scenario: Inicio de sesión fallido con correo correcto pero contraseña incorrecta
    Given navego a la URL "https://taskhub.cl/"
    When ingreso en el campo de nombre de usuario con id "email" el texto "igna.veliz@duocuc.cl"
    And ingreso en el campo de contraseña con id "password" el texto "incorrect_password"
    And hago clic en el botón de inicio de sesión con id "login_button"
    Then debería permanecer en la URL "https://taskhub.cl/"

  Scenario: Inicio de sesión fallido con correo incorrecto pero contraseña correcta
    Given navego a la URL "https://taskhub.cl/"
    When ingreso en el campo de nombre de usuario con id "email" el texto "incorrect_email@example.com"
    And ingreso en el campo de contraseña con id "password" el texto "123123123"
    And hago clic en el botón de inicio de sesión con id "login_button"
    Then debería permanecer en la URL "https://taskhub.cl/"

  Scenario: Inicio de sesión fallido con correo y contraseña incorrectos
    Given navego a la URL "https://taskhub.cl/"
    When ingreso en el campo de nombre de usuario con id "email" el texto "incorrect_email@example.com"
    And ingreso en el campo de contraseña con id "password" el texto "incorrect_password"
    And hago clic en el botón de inicio de sesión con id "login_button"
    Then debería permanecer en la URL "https://taskhub.cl/"

  Scenario: Inicio de sesión fallido con el campo de correo vacío
    Given navego a la URL "https://taskhub.cl/"
    When ingreso en el campo de nombre de usuario con id "email" el texto ""
    And ingreso en el campo de contraseña con id "password" el texto "123123123"
    And hago clic en el botón de inicio de sesión con id "login_button"
    Then debería permanecer en la URL "https://taskhub.cl/"

  Scenario: Inicio de sesión fallido con correo correcto pero contraseña vacía
    Given navego a la URL "https://taskhub.cl/"
    When ingreso en el campo de nombre de usuario con id "email" el texto "igna.veliz@duocuc.cl"
    And ingreso en el campo de contraseña con id "password" el texto ""
    And hago clic en el botón de inicio de sesión con id "login_button"
    Then debería permanecer en la URL "https://taskhub.cl/"

  Scenario: Inicio de sesión fallido con ambos campos vacíos
    Given navego a la URL "https://taskhub.cl/"
    When ingreso en el campo de nombre de usuario con id "email" el texto ""
    And ingreso en el campo de contraseña con id "password" el texto ""
    And hago clic en el botón de inicio de sesión con id "login_button"
    Then debería permanecer en la URL "https://taskhub.cl/"

  Scenario: Inicio de sesión fallido con intento de inyección SQL
    Given navego a la URL "https://taskhub.cl/"
    When ingreso en el campo de nombre de usuario con id "email" el texto "' OR '1'='1"
    And ingreso en el campo de contraseña con id "password" el texto "' OR '1'='1"
    And hago clic en el botón de inicio de sesión con id "login_button"
    Then debería permanecer en la URL "https://taskhub.cl/"
