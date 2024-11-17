package DefinicionPasos;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;

import io.cucumber.java.en.*;

public class CrearProyecto {

	static WebDriver driver;
    static WebDriverWait wait;

    static {
        try {
            driver = Configuracion.configure(); // Configuración del WebDriver
            wait = new WebDriverWait(driver, Duration.ofSeconds(1));
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error al configurar el WebDriver: " + e.getMessage());
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
        System.out.println("URL actual: " + currentUrl);
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
        System.out.println("URL actual: " + currentUrl);
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

    @And("Seleccionar el primer cliente del selector con id {string}")
    public void seleccionarPrimerCliente(String id) {
        WebElement selectElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        Select select = new Select(selectElement);
        if (!select.getOptions().isEmpty()) {
            select.selectByIndex(1);
        } else {
            throw new AssertionError("No hay opciones disponibles para seleccionar en el selector de clientes.");
        }
    }

    @And("Seleccionar el primer jefe de proyecto del selector con id {string}")
    public void seleccionarPrimerJefeProyecto(String id) {
        WebElement selectElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        Select select = new Select(selectElement);
        if (!select.getOptions().isEmpty()) {
            select.selectByIndex(1);
        } else {
            throw new AssertionError("No hay opciones disponibles para seleccionar en el selector de jefe de proyecto.");
        }
    }

    @And("Seleccionar el primer tipo de proyecto del selector con id {string}")
    public void seleccionarPrimerTipoProyecto(String id) {
        WebElement selectElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        Select select = new Select(selectElement);
        if (!select.getOptions().isEmpty()) {
            select.selectByIndex(1);
        } else {
            throw new AssertionError("No hay opciones disponibles para seleccionar en el selector de tipo de proyecto.");
        }
    }

    @When("Hacer clic en el botón de guardar con id {string}")
    public void hacerClickGuardar(String id) {
        WebElement botonGuardar = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
        botonGuardar.click();
    }

    @Then("Verificar que llegamos a la vista del proyecto con la URL que contiene {string}")
    public void verificarVistaProyectoShow(String textoEsperadoEnUrl) {
        try {
            String currentUrl = driver.getCurrentUrl();
            System.out.println("URL actual: " + currentUrl);

            if (!currentUrl.contains(textoEsperadoEnUrl)) {
                throw new AssertionError("Se esperaba que la URL contuviera: " + textoEsperadoEnUrl + ", pero se encontró: " + currentUrl);
            }

            // Esperar 2 segundos antes de cerrar
            System.out.println("Esperando 2 segundos antes de cerrar la pestaña...");
            Thread.sleep(2000);

            // Cerrar todas las ventanas y finalizar la sesión
            System.out.println("Cerrando todas las ventanas y finalizando la sesión...");
            driver.quit();
            System.out.println("Sesión finalizada correctamente.");
        } catch (InterruptedException e) {
            throw new RuntimeException("Error durante la espera antes de cerrar la pestaña: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cerrar las ventanas después de la verificación: " + e.getMessage());
        }
    }
    
}
