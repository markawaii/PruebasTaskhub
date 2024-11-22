package DefinicionPasos;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.And;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class EliminarProyecto {

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

    @When("Hacer clic en el botón de eliminar proyecto con id {string}")
    public void hacerClicEnElBotónDeEliminarProyectoConId(String id) {
        try {
            WebElement boton = wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
            boton.click();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al eliminar el proyecto: " + e.getMessage() + " estas seguro de que existe el identificador " + id);
        }
    }

    @And("hacer click en el boton de confirmar que se quiere eliminar el proyecto")
    public void hacerClickEnElBotonDeConfirmarQueSeQuiereEliminarElProyecto() {
        try {
            WebElement boton = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("/html/body/div[3]/div/div[6]/button[3]")));
            boton.click();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al confirmar la eliminacion el proyecto: " + e.getMessage());
        }
    }
}
