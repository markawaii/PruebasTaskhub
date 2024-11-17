Feature: Crear Proyecto

  Background:
    Given Navegar a la página principal "https://taskhub.cl/"
    And Ingresar el usuario en el campo con id "email" con el texto "igna.veliz@duocuc.cl"
    And Ingresar la contraseña en el campo con id "password" con el texto "123123123"
    And Hacer clic en el botón con id "login_button"
    Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"

  Scenario: Crear un nuevo proyecto
    Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
    Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
    And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "proyecto 1"
    And Seleccionar el primer cliente del selector con id "cliente_id"
    And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
    And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    Then Verificar que llegamos a la vista del proyecto con la URL que contiene "show"
    
