Feature: Visualizar Proyecto

  Background:
    Given Acceder a la página principal "https://taskhub.cl/"
    And Proveer el usuario con id "email" y el valor "igna.veliz@duocuc.cl"
    And Proveer la contraseña con id "password" y el valor "123123123"
    And Pulsar el botón con id "login_button"
    Then Confirmar que estamos en la página inicial "https://taskhub.cl/inicio"

  Scenario: Abrir y visualizar el proyecto existente
    When Hacer clic en el menú lateral con id "menu-proyectos"
    Then Confirmar que hemos ingresado a la página de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto titulado "Nescafessss" y pulsar el botón con id "btn-ver-1"
    Then Confirmar que hemos ingresado a la vista de detalles del proyecto "https://taskhub.cl/proyecto/show/1"

    # Validaciones de la sección "Información del proyecto"
    And Validar que la sección "Información del proyecto" está visible
    And Validar que el campo "Nombre" muestra "Nescafessss"
    And Validar que el campo "Cliente" muestra "Ignacio Andres Veliz Seguel"
    And Validar que el campo "Jefe de proyecto" muestra "Alessandro Halvorson"
    And Validar que el campo "Fecha de inicio" muestra "2024-11-25"
    And Validar que el campo "Fecha de fin" muestra "2024-11-30"
    And Validar que el campo "Total de horas del proyecto" muestra "475"
    And Validar que el campo "Estado" muestra "En Desarrolo"
    And Validar que el campo "Tipo de proyecto" muestra "Interno"
    And Validar que el campo "Porcentaje de avance" muestra "13%"
    And Validar que el campo "Última actualización de avance" muestra "Aun sin avance"
    And Validar que el campo "Cerrado" muestra "n/a"
    And Validar que el campo "Fecha cierre de proyecto" muestra "n/a"
