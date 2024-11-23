package DefinicionPasos;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;
import static org.junit.Assert.*;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.*;

public class VisualizarProyecto {

    static WebDriver driver;
    static WebDriverWait wait;

    @Before
    public void setUp() {
        try {
            driver = Configuracion.configure();
            wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // 10 segundos para evitar problemas de sincronización
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error al configurar el WebDriver: " + e.getMessage());
        }
    }

    @After
    public void tearDown() {
        if (driver != null) {
            Configuracion.cerrarDriver();
        }
    }

    @Given("Acceder a la página principal {string}")
    public void acceder_a_la_pagina_principal(String url) {
        driver.get(url);
        wait.until(ExpectedConditions.urlToBe(url));
    }

    @And("Proveer el usuario con id {string} y el valor {string}")
    public void proveer_el_usuario(String id, String valor) {
        WebElement inputUsuario = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        inputUsuario.clear();
        inputUsuario.sendKeys(valor);
    }

    @And("Proveer la contraseña con id {string} y el valor {string}")
    public void proveer_la_contrasena(String id, String valor) {
        WebElement inputContrasena = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        inputContrasena.clear();
        inputContrasena.sendKeys(valor);
    }

    @And("Pulsar el botón con id {string}")
    public void pulsar_el_boton(String id) {
        WebElement boton = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
        boton.click();
    }

    @Then("Confirmar que estamos en la página inicial {string}")
    public void confirmar_pagina_inicial(String url) {
        wait.until(ExpectedConditions.urlToBe(url));
    }

    @When("Hacer clic en el menú lateral con id {string}")
    public void hacer_clic_menu_lateral(String id) {
        WebElement menu = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
        menu.click();
    }

    @Then("Confirmar que hemos ingresado a la página de proyectos {string}")
    public void confirmar_pagina_proyectos(String url) {
        wait.until(ExpectedConditions.urlToBe(url));
    }

    @When("Seleccionar el proyecto titulado {string} y pulsar el botón con id {string}")
    public void seleccionar_proyecto(String titulo, String idBoton) {
        WebElement botonVerProyecto = wait.until(ExpectedConditions.elementToBeClickable(By.id(idBoton)));
        botonVerProyecto.click();
    }

    @Then("Confirmar que hemos ingresado a la vista de detalles del proyecto {string}")
    public void confirmar_vista_detalles_proyecto(String url) {
        wait.until(ExpectedConditions.urlToBe(url));
    }

    @Then("Validar que la sección {string} está visible")
    public void validar_seccion_visible(String textoSeccion) {
        try {
            WebElement seccion = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//h5[contains(text(), '" + textoSeccion + "')]")));
            assertTrue("La sección no está visible.", seccion.isDisplayed());
        } catch (Exception e) {
            throw new AssertionError("No se pudo encontrar la sección con el texto: " + textoSeccion + ". Error: " + e.getMessage());
        }
    }

    @Then("Validar que el campo {string} muestra {string}")
    public void validar_campo_muestra(String campo, String valorEsperado) {
        try {
            WebElement elemento = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//div[strong[text()='" + campo + "']]/following-sibling::div")));
            assertEquals("El valor del campo no coincide.", valorEsperado, elemento.getText().trim());
        } catch (Exception e) {
            throw new AssertionError("No se pudo encontrar el campo '" + campo + "'. Error: " + e.getMessage());
        }
    }

    @Then("Validar que el campo {string} no está vacío")
    public void validar_campo_no_vacio(String campo) {
        WebElement elemento = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.xpath("//div[contains(text(), '" + campo + "')]/following-sibling::div")));
        assertFalse("El campo está vacío.", elemento.getText().isEmpty());
    }

    @Then("Validar que la barra de {string} muestra un porcentaje de {string}")
    public void validar_barra_muestra_porcentaje(String barra, String porcentajeEsperado) {
        WebElement barraElemento = wait.until(ExpectedConditions.visibilityOfElementLocated(
                By.xpath("//div[contains(@title, '" + barra + "')]/div/div[@class='progress-bar']")));
        String porcentajeActual = barraElemento.getAttribute("style").replace("width: ", "").replace(";", "");
        assertTrue("El porcentaje no coincide. Esperado: " + porcentajeEsperado + ", Actual: " + porcentajeActual,
                porcentajeActual.contains(porcentajeEsperado));
    }

    @Then("Confirmar que el gráfico de participación en el proyecto está visible")
    public void confirmar_grafico_visible() {
        WebElement grafico = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("chartjs-pie")));
        assertTrue("El gráfico no está visible.", grafico.isDisplayed());
    }

    @Then("Validar que el gráfico contiene al menos los valores: {string}, {string}, {string}")
    public void validar_grafico_valores(String valor1, String valor2, String valor3) {
        WebElement grafico = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("chartjs-pie")));
        String datosGrafico = grafico.getAttribute("data-dataset"); // Ajustar según cómo se exponen los datos
        assertTrue("El gráfico no contiene el valor esperado: " + valor1, datosGrafico.contains(valor1));
        assertTrue("El gráfico no contiene el valor esperado: " + valor2, datosGrafico.contains(valor2));
        assertTrue("El gráfico no contiene el valor esperado: " + valor3, datosGrafico.contains(valor3));
    }
}
