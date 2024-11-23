package DefinicionPasos;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.awt.*;
import java.awt.event.KeyEvent;
import java.time.Duration;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.*;

public class CrearProyecto {

    static WebDriver driver;
    static WebDriverWait wait;

    @Before
    public void setUp() {
        try {
            driver = Configuracion.configure(); // Configuración del WebDriver
            wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // Aumentado a 10 segundos para evitar problemas de sincronización
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error al configurar el WebDriver: " + e.getMessage());
        }
    }

    @After
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }

    @Given("Navegar a la página principal {string}")
    public void navegarPaginaPrincipal(String url) {
        driver.get(url);
        wait.until(ExpectedConditions.urlToBe(url));
    }

    @And("Ingresar el usuario en el campo con id {string} con el texto {string}")
    public void ingresarUsuario(String id, String texto) {
        WebElement campoUsuario = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        campoUsuario.clear();
        campoUsuario.sendKeys(texto);
    }

    @And("Ingresar la contraseña en el campo con id {string} con el texto {string}")
    public void ingresarContrasena(String id, String texto) {
        WebElement campoContrasena = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        campoContrasena.clear();
        campoContrasena.sendKeys(texto);
    }

    @And("Hacer clic en el botón con id {string}")
    public void hacerClickBoton(String id) {
        WebElement boton = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
        boton.click();
    }

    @Then("Verificar que estamos en la página de inicio {string}")
    public void verificarPaginaInicio(String url) {
        wait.until(ExpectedConditions.urlToBe(url));
    }

    @When("Hacer clic en el botón de navegación con id {string}")
    public void hacerClickBotonNavegacion(String id) {
        WebElement botonNavegacion = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
        botonNavegacion.click();
    }

    @Then("Verificar que ingresamos a la vista de proyectos {string}")
    public void verificarVistaProyectos(String url) {
        String currentUrl = driver.getCurrentUrl();
        if (!currentUrl.equals(url)) {
            throw new AssertionError("URL esperada: " + url + ", pero se encontró: " + currentUrl);
        }
    }

    @When("Hacer clic en el botón de nuevo proyecto con id {string}")
    public void hacerClickNuevoProyecto(String id) {
        WebElement botonNuevoProyecto = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
        botonNuevoProyecto.click();
    }

    @Then("Verificar que ingresamos a la vista de creación de proyectos {string}")
    public void verificarVistaCreacionProyectos(String url) {
        String currentUrl = driver.getCurrentUrl();
        if (!currentUrl.equals(url)) {
            throw new AssertionError("URL esperada: " + url + ", pero se encontró: " + currentUrl);
        }
    }

    @And("Ingresar el nombre del nuevo proyecto con id {string} con el texto {string}")
    public void ingresarNombreNuevoProyecto(String id, String texto) throws InterruptedException {
        WebElement campoNombre = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        campoNombre.clear();
        campoNombre.sendKeys(texto);
    }

    @Then("Dejar el campo vacío con id {string}")
    public void dejarCampoNombreVacio(String id) {
        WebElement campoNombre = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        campoNombre.clear(); // Dejar vacío el campo
    }

    @And("Seleccionar el primer cliente del selector con id {string}")
    public void seleccionarPrimerCliente(String id) {
        seleccionarPrimerOpcion(id, "cliente");
    }

    @And("Seleccionar el primer jefe de proyecto del selector con id {string}")
    public void seleccionarPrimerJefeProyecto(String id) {
        seleccionarPrimerOpcion(id, "jefe de proyecto");
    }

    @And("Seleccionar el primer tipo de proyecto del selector con id {string}")
    public void seleccionarPrimerTipoProyecto(String id) {
        seleccionarPrimerOpcion(id, "tipo de proyecto");
    }

    @Then("No seleccionar cliente en el selector con id {string}")
    public void noSeleccionarCliente(String id) {
        seleccionarOpcionVacia(id, "cliente");
    }

    @Then("No seleccionar jefe de proyecto en el selector con id {string}")
    public void noSeleccionarJefeDeProyecto(String id) {
        seleccionarOpcionVacia(id, "jefe de proyecto");
    }

    @Then("No seleccionar tipo de proyecto en el selector con id {string}")
    public void noSeleccionarTipoDeProyecto(String id) {
        seleccionarOpcionVacia(id, "tipo de proyecto");
    }

    @When("Hacer clic en el botón de guardar con id {string}")
    public void hacerClickGuardar(String id) {

        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        WebElement botonGuardar = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
        botonGuardar.click();
    }

    @Then("Verificar que llegamos a la vista del proyecto con la URL que contiene {string}")
    public void verificarVistaProyectoShow(String textoEsperadoEnUrl) {
        String currentUrl = driver.getCurrentUrl();
        if (!currentUrl.contains(textoEsperadoEnUrl)) {
            throw new AssertionError("Se esperaba que la URL contuviera: " + textoEsperadoEnUrl + ", pero se encontró: " + currentUrl);
        }
    }

    @And("Permanecer en la vista de creación de proyectos {string}")
    public void permanecerEnVistaCreacion(String url) {
        verificarVistaCreacionProyectos(url);
    }

    private void seleccionarPrimerOpcion(String id, String campo) {
        WebElement selectElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        Select select = new Select(selectElement);
        if (!select.getOptions().isEmpty()) {
            select.selectByIndex(1);
        } else {
            throw new AssertionError("No hay opciones disponibles para seleccionar en el selector de " + campo + ".");
        }
    }

    private void seleccionarOpcionVacia(String id, String campo) {
        WebElement selectElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        Select select = new Select(selectElement);
        try {
            select.selectByIndex(0); // Asume que la opción vacía es el índice 0
            System.out.println("No se seleccionó ninguna opción para el campo: " + campo);
        } catch (Exception e) {
            throw new AssertionError("No se pudo dejar vacío el campo '" + campo + "'. Verifique las opciones disponibles.");
        }
    }

    @When("Hacer clic en el botón agregar nueva fase con id {string}")
    public void hacerClicEnElBotónAgregarNuevaFaceConId(String id) throws InterruptedException {
        WebElement btn = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
        btn.click();
    }

    @And("Ingresar la cantidad de horas en el campo con id {string} con el texto {string}")
    public void ingresarCantidadHorasNuevoProyecto(String id, String texto) throws InterruptedException {
        WebElement campoNombre = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        campoNombre.clear();
        campoNombre.sendKeys(texto);
    }
}
