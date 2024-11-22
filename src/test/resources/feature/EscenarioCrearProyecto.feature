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
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "Proyecto normal sin fase"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		Then Verificar que llegamos a la vista del proyecto con la URL que contiene "show"

	Scenario: Crear un nuevo proyecto con una face inicial
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "Proyecto con fase inicial"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "25"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		Then Verificar que llegamos a la vista del proyecto con la URL que contiene "show"

	Scenario: Crear un nuevo proyecto con una face inicial pero sin nombre de proyecto
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Dejar el campo vacío con id "nombre"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "25"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con una face inicial sin nombre y sin nombre de proyecto
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Dejar el campo vacío con id "nombre"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Dejar el campo vacío con id "nombre_fase1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "25"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con una face inicial sin nombre y sin horas de fase
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Dejar el campo vacío con id "nombre"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Dejar el campo vacío con id "hora_asignada1"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con una face inicial pero con nombre-fase y cantidad-horas vacios
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "proyecto 1"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Dejar el campo vacío con id "nombre_fase1"
		And Dejar el campo vacío con id "hora_asignada1"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con una face inicial pero con nombre-fase y sin cantidad-horas
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "proyecto 1"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Dejar el campo vacío con id "hora_asignada1"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con una face inicial pero sin nombre-fase pero con cantidad-horas
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "proyecto 1"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Dejar el campo vacío con id "nombre_fase1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "Fase 1"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con dos fases iniciales
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "Proyecto con dos fases iniciales"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "25"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase2" con el texto "Fase 2"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada2" con el texto "30"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		Then Verificar que llegamos a la vista del proyecto con la URL que contiene "show"

	Scenario: Crear un nuevo proyecto con dos fases iniciales y la segunda sin nombre
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "proyecto 1"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "25"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Dejar el campo vacío con id "nombre_fase2"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada2" con el texto "30"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con dos fases iniciales y la segunda sin horas asignadas
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "proyecto 1"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "25"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase2" con el texto "30"
		And Dejar el campo vacío con id "hora_asignada2"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con dos fases iniciales pero sin nombre de proyecto
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Dejar el campo vacío con id "nombre"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "25"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase2" con el texto "Fase 2"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada2" con el texto "30"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con dos fases iniciales y la primera sin nombre
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "proyecto 1"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Dejar el campo vacío con id "nombre_fase1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "25"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase2" con el texto "Fase 2"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada2" con el texto "50"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con dos fases iniciales y la primera sin horas
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "proyecto 1"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Dejar el campo vacío con id "hora_asignada1"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase2" con el texto "Fase 2"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada2" con el texto "50"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto con dos fases iniciales sin tipo de proyecto
		Then Verificar que estamos en la página de inicio "https://taskhub.cl/inicio"
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "proyecto 1"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And No seleccionar cliente en el selector con id "tipo_proyecto_id"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase1" con el texto "Fase 1"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada1" con el texto "25"
		When Hacer clic en el botón agregar nueva fase con id "agregarNuevaFase"
		And Ingresar el nombre del nuevo proyecto con id "nombre_fase2" con el texto "Fase 2"
		And Ingresar la cantidad de horas en el campo con id "hora_asignada2" con el texto "30"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un nuevo proyecto sin nombre
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Dejar el campo vacío con id "nombre"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    #Then Verificar que el campo con id "cliente_id" muestra un mensaje de validación "Completa este campo"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin cliente
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "Proyecto sin cliente"
		And No seleccionar cliente en el selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
    #Then Verificar que el campo con id "cliente_id" muestra un mensaje de validación "Completa este campo"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin jefe de proyecto
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "Proyecto sin jefe de proyecto"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And No seleccionar jefe de proyecto en el selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
	  #Then Verificar que el campo con id "jefe_proyecto_id" muestra un mensaje de validación "Completa este campo"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin tipo de proyecto
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "Proyecto sin tipo de proyecto"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And No seleccionar tipo de proyecto en el selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
	  #Then Verificar que el campo con id "tipo_proyecto_id" muestra un mensaje de validación "Completa este campo"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin nombre y sin cliente
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Dejar el campo vacío con id "nombre"
		And No seleccionar cliente en el selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin nombre y sin jefe de proyecto
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Dejar el campo vacío con id "nombre"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And No seleccionar jefe de proyecto en el selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin nombre y sin tipo de proyecto
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Dejar el campo vacío con id "nombre"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And No seleccionar tipo de proyecto en el selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin cliente y sin jefe de proyecto
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "Proyecto sin cliente y sin jefe de proyecto"
		And No seleccionar cliente en el selector con id "cliente_id"
		And No seleccionar jefe de proyecto en el selector con id "jefe_proyecto_id"
		And Seleccionar el primer tipo de proyecto del selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin cliente y sin tipo de proyecto
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "Proyecto sin cliente y sin tipo de proyecto"
		And No seleccionar cliente en el selector con id "cliente_id"
		And Seleccionar el primer jefe de proyecto del selector con id "jefe_proyecto_id"
		And No seleccionar tipo de proyecto en el selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin jefe de proyecto y sin tipo de proyecto
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Ingresar el nombre del nuevo proyecto con id "nombre" con el texto "Proyecto sin jefe de proyecto y sin tipo de proyecto"
		And Seleccionar el primer cliente del selector con id "cliente_id"
		And No seleccionar jefe de proyecto en el selector con id "jefe_proyecto_id"
		And No seleccionar tipo de proyecto en el selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"

	Scenario: Crear un proyecto sin ningún dato
		When Hacer clic en el botón de navegación con id "menu-proyectos"
		Then Verificar que ingresamos a la vista de proyectos "https://taskhub.cl/proyecto"
		When Hacer clic en el botón de nuevo proyecto con id "btn-nuevo-proyecto"
		Then Verificar que ingresamos a la vista de creación de proyectos "https://taskhub.cl/proyecto/create"
		And Dejar el campo vacío con id "nombre"
		And No seleccionar cliente en el selector con id "cliente_id"
		And No seleccionar jefe de proyecto en el selector con id "jefe_proyecto_id"
		And No seleccionar tipo de proyecto en el selector con id "tipo_proyecto_id"
		When Hacer clic en el botón de guardar con id "btn-guardar-proyecto"
		And Permanecer en la vista de creación de proyectos "https://taskhub.cl/proyecto/create"


