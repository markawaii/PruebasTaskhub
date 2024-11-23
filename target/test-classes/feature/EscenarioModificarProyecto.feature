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
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Cambiar el nombre del proyecto con id "nombre" al texto "Proyecto modificado"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    Then Verificar que aparece el mensaje de éxito "Proyecto modificado exitosamente" en el elemento "swal2-title"
    And Aceptar la alerta
    Then Verificar que el proyecto se actualizó con el nombre "Proyecto modificado"
    And Verificar que llegamos a la vista del proyecto para modificar con la URL que contiene "show"

  Scenario: Modificar el tipo de un proyecto existente
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Seleccionar la opcion "2" del selector con id "tipo_proyecto_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    Then Verificar que aparece el mensaje de éxito "Proyecto modificado exitosamente" en el elemento "swal2-title"
    And Aceptar la alerta
    Then Verificar que el tipo de proyecto se actualizó a "Interno"
    And Verificar que llegamos a la vista del proyecto para modificar con la URL que contiene "show"

  Scenario: Modificar el jefe de un proyecto existente
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Seleccionar la opcion "2" del selector con id "jefe_proyecto_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    Then Verificar que aparece el mensaje de éxito "Proyecto modificado exitosamente" en el elemento "swal2-title"
    And Aceptar la alerta
    Then Verificar que el jefe de proyecto se actualizó a "Alessandro Halvorson"
    And Verificar que llegamos a la vista del proyecto para modificar con la URL que contiene "show"

  Scenario: Modificar el la fecha de un proyecto existente
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Modificar la fecha con el campo "daterange" del proyecto a "25/11/2024 - 30/11/2024"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    Then Verificar que aparece el mensaje de éxito "Proyecto modificado exitosamente" en el elemento "swal2-title"
    And Aceptar la alerta
    Then Verificar que fecha de inicio proyecto se actualizó a "2024-11-25"
    Then Verificar que fecha de termino proyecto se actualizó a "2024-11-30"
    And Verificar que llegamos a la vista del proyecto para modificar con la URL que contiene "show"

  Scenario: Modificar un proyecto existente dejando el nombre vacio
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Dejar el campo vacío con id "nombre"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Permanecer en la vista de modificaion de proyectos "https://taskhub.cl/proyecto/edit/1"

  Scenario: Modificar un proyecto existente dejando el cliente vacio
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And No seleccionar cliente en el selector con id "cliente_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Permanecer en la vista de modificaion de proyectos "https://taskhub.cl/proyecto/edit/1"

  Scenario: Modificar un proyecto existente dejando el jefe de proyecto vacio
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And No seleccionar jefe de proyecto en el selector con id "jefe_proyecto_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Permanecer en la vista de modificaion de proyectos "https://taskhub.cl/proyecto/edit/1"

  Scenario: Modificar un proyecto existente dejando el tipo de proyecto vacio
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And No seleccionar tipo de proyecto en el selector con id "tipo_proyecto_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Permanecer en la vista de modificaion de proyectos "https://taskhub.cl/proyecto/edit/1"

  Scenario: Modificar un proyecto existente dejando el nombre de proyecto y cliente vacio
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Dejar el campo vacío con id "nombre"
    And No seleccionar cliente en el selector con id "cliente_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Permanecer en la vista de modificaion de proyectos "https://taskhub.cl/proyecto/edit/1"

  Scenario: Modificar un proyecto existente dejando el nombre de proyecto y jefe de proyecto vacio
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Dejar el campo vacío con id "nombre"
    And No seleccionar jefe de proyecto en el selector con id "jefe_proyecto_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Permanecer en la vista de modificaion de proyectos "https://taskhub.cl/proyecto/edit/1"

  Scenario: Modificar un proyecto existente dejando el nombre de proyecto y tipo de proyecto vacio
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Dejar el campo vacío con id "nombre"
    And No seleccionar tipo de proyecto en el selector con id "tipo_proyecto_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Permanecer en la vista de modificaion de proyectos "https://taskhub.cl/proyecto/edit/1"

  Scenario: Modificar un proyecto existente dejando el nombre de proyecto y tipo de proyecto y jefe de proyecto vacio
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Dejar el campo vacío con id "nombre"
    And No seleccionar tipo de proyecto en el selector con id "tipo_proyecto_id"
    And No seleccionar jefe de proyecto en el selector con id "jefe_proyecto_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Permanecer en la vista de modificaion de proyectos "https://taskhub.cl/proyecto/edit/1"

  Scenario: Modificar un proyecto existente dejando el nombre de proyecto y tipo de proyecto y jefe de proyecto y cliente vacio
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Nescafessss" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Dejar el campo vacío con id "nombre"
    And No seleccionar tipo de proyecto en el selector con id "tipo_proyecto_id"
    And No seleccionar jefe de proyecto en el selector con id "jefe_proyecto_id"
    And No seleccionar cliente en el selector con id "cliente_id"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Permanecer en la vista de modificaion de proyectos "https://taskhub.cl/proyecto/edit/1"

  Scenario: Revertir el nombre del proyecto al anterior
    When Hacer clic en el botón de navegación con id "menu-proyectos"
    Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
    When Seleccionar el proyecto con nombre "Proyecto modificado" y hacer clic en "btn-editar-1"
    Then Verificar que ingresamos a la vista de edición del proyecto "https://taskhub.cl/proyecto/edit/1"
    And Cambiar el nombre del proyecto con id "nombre" al texto "Nescafessss"
    When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    And Aceptar la alerta de éxito
    Then Verificar que el proyecto se actualizó con el nombre "Nescafessss"
    And Verificar que llegamos a la vista del proyecto para modificar con la URL que contiene "show"
