Feature: Modificar Proyecto

  Background:
    Given Navegar a la página principal "https://taskhub.cl/"
    And Ingresar el usuario en el campo con id "email" con el texto "igna.veliz@duocuc.cl"
    And Ingresar la contraseña en el campo con id "password" con el texto "123123123"
    And Hacer clic en el botón con id "login_button"
    Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"

  Scenario: Modificar el nombre de un proyecto existente
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Proyecto de prueba" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista del proyecto con la URL que contiene "proyecto/show"
    When Hacer clic en el botón de editar con id "btn-editar-proyecto"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Cambiar el nombre del proyecto con id "nombre" al texto "Proyecto modificado"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    Then Verificar que el proyecto se actualizó con el nombre "Proyecto modificado"
