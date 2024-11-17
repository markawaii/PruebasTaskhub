package DefinicionPasos;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;

import io.cucumber.java.en.*;

public class CrearProyecto {

    static WebDriver driver;
    static WebDriverWait wait;

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
    public void ingresarNombreNuevoProyecto(String id, String texto) {
        WebElement campoNombre = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        campoNombre.clear();
        campoNombre.sendKeys(texto);
    }

    @And("Seleccionar el primer jefe de proyecto del selector con id {string}")
    public void seleccionarPrimerJefeProyecto(String id) {
        WebElement selectElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        Select select = new Select(selectElement);
        if (!select.getOptions().isEmpty()) {
            select.selectByIndex(1);
        } else {
            throw new AssertionError("No hay opciones disponibles en el selector de jefe de proyecto.");
        }
    }

    @And("Seleccionar el primer tipo de proyecto del selector con id {string}")
    public void seleccionarPrimerTipoProyecto(String id) {
        WebElement selectElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        Select select = new Select(selectElement);
        if (!select.getOptions().isEmpty()) {
            select.selectByIndex(1);
        } else {
            throw new AssertionError("No hay opciones disponibles en el selector de tipo de proyecto.");
        }
    }

    @When("Hacer clic en el botón de guardar con id {string}")
    public void hacerClickGuardar(String id) {
        WebElement botonGuardar = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
        botonGuardar.click();
    }

    @Then("Verificar que el campo con id {string} muestra un mensaje de validación {string}")
    public void verificarMensajeDeValidacion(String id, String mensajeEsperado) {
        WebElement campo = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        ((org.openqa.selenium.JavascriptExecutor) driver).executeScript("arguments[0].reportValidity();", campo);
        String mensajeActual = campo.getAttribute("validationMessage");
        if (!mensajeActual.equals(mensajeEsperado)) {
            throw new AssertionError("Mensaje de validación esperado: " + mensajeEsperado + ", pero se encontró: " + mensajeActual);
        }
    }

    @Then("Permanecer en la vista de creación de proyectos {string}")
    public void permanecerEnVistaCreacionProyectos(String urlEsperada) {
        String currentUrl = driver.getCurrentUrl();
        if (!currentUrl.equals(urlEsperada)) {
            throw new AssertionError("URL esperada: " + urlEsperada + ", pero se encontró: " + currentUrl);
        }
    }
}
