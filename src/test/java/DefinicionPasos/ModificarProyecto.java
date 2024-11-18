package DefinicionPasos;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class ModificarProyecto {

    WebDriver driver;
    WebDriverWait wait;

    // Constructor explícito para inicializar el WebDriver y evitar problemas
    public ModificarProyecto() {
        try {
            driver = Configuracion.configure();
            wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        } catch (Exception e) {
            throw new RuntimeException("Error al inicializar el WebDriver: " + e.getMessage());
        }
    }

    @When("Seleccionar el proyecto con nombre {string} y hacer clic en {string}")
    public void seleccionar_el_proyecto_con_nombre_y_hacer_clic_en(String nombreProyecto, String idBoton) {
        try {
            WebElement proyecto = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//td[text()='" + nombreProyecto + "']")));
            proyecto.click();
            WebElement botonEditar = wait.until(ExpectedConditions.elementToBeClickable(By.id(idBoton)));
            botonEditar.click();
        } catch (Exception e) {
            throw new RuntimeException("Error al seleccionar el proyecto o hacer clic en el botón: " + e.getMessage());
        }
    }

    @When("Hacer clic en el botón de editar con id {string}")
    public void hacer_clic_en_el_boton_de_editar_con_id(String idBoton) {
        try {
            WebElement botonEditar = wait.until(ExpectedConditions.elementToBeClickable(By.id(idBoton)));
            botonEditar.click();
        } catch (Exception e) {
            throw new RuntimeException("Error al hacer clic en el botón de editar: " + e.getMessage());
        }
    }

    @Then("Verificar que ingresamos a la vista de edición del proyecto {string}")
    public void verificar_que_ingresamos_a_la_vista_de_edicion_del_proyecto(String urlEsperada) {
        try {
            String currentUrl = driver.getCurrentUrl();
            if (!currentUrl.equals(urlEsperada)) {
                throw new AssertionError("La URL actual no coincide con la esperada: " + urlEsperada);
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al verificar la URL de edición: " + e.getMessage());
        }
    }

    @Then("Cambiar el nombre del proyecto con id {string} al texto {string}")
    public void cambiar_el_nombre_del_proyecto_con_id_al_texto(String idCampo, String nuevoNombre) {
        try {
            WebElement campoNombre = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(idCampo)));
            campoNombre.clear();
            campoNombre.sendKeys(nuevoNombre);
        } catch (Exception e) {
            throw new RuntimeException("Error al cambiar el nombre del proyecto: " + e.getMessage());
        }
    }

    @Then("Verificar que el proyecto se actualizó correctamente con el nombre {string}")
    public void verificar_que_el_proyecto_se_actualizo_correctamente_con_el_nombre(String nombreEsperado) {
        try {
            WebElement nombreProyecto = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//h1[text()='" + nombreEsperado + "']")));
            if (!nombreProyecto.isDisplayed()) {
                throw new AssertionError("El nombre del proyecto no se actualizó correctamente: " + nombreEsperado);
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al verificar el nombre actualizado: " + e.getMessage());
        }
    }

    @Then("Verificar que llegamos a la vista del proyecto para modificar con la URL que contiene {string}")
    public void verificar_que_llegamos_a_la_vista_del_proyecto_para_modificar_con_la_url_que_contiene(String textoEsperadoEnUrl) {
        try {
            String currentUrl = driver.getCurrentUrl();
            if (!currentUrl.contains(textoEsperadoEnUrl)) {
                throw new AssertionError("Se esperaba que la URL contuviera: " + textoEsperadoEnUrl + ", pero se encontró: " + currentUrl);
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al verificar la URL del proyecto: " + e.getMessage());
        }
    }
    
    
}
