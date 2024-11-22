Feature: Eliminar Proyecto

  Background:
    Given Navegar a la página principal "https://taskhub.cl/"
    And Ingresar el usuario en el campo con id "email" con el texto "igna.veliz@duocuc.cl"
    And Ingresar la contraseña en el campo con id "password" con el texto "123123123"
    And Hacer clic en el botón con id "login_button"
    Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"

  Scenario: Eliminar un proyecto
    Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Hacer clic en el botón de eliminar proyecto con id "btn-eliminar-176"
    And hacer click en el boton de confirmar que se quiere eliminar el proyecto
    Then Verificar que llegamos a la vista del proyecto con la URL que contiene "proyecto"

  Scenario: Eliminar un proyecto con fase
    Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Hacer clic en el botón de eliminar proyecto con id "btn-eliminar-177"
    And hacer click en el boton de confirmar que se quiere eliminar el proyecto
    Then Verificar que llegamos a la vista del proyecto con la URL que contiene "proyecto"
