package DefinicionPasos;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.time.Duration;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.*;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;


public class Login {
	
	private WebDriver driver; // Instancia local del WebDriver
    private WebDriverWait wait;

    @Before
    public void setUp() {
        try {
            driver = Configuracion.configure(); // Obtén la instancia del WebDriver desde Configuracion
            wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // Tiempo de espera para condiciones explícitas
        } catch (Exception e) {
            throw new RuntimeException("Error al configurar el WebDriver: " + e.getMessage());
        }
    }

    @After
    public void tearDown() {
        Configuracion.cerrarDriver(); // Cierra el WebDriver después de la prueba
    }

    @Given("navego a la URL {string}")
    public void navego_a_la_url(String url) {
        driver.get(url);
        System.out.println("Navegando a la URL: " + url);
    }

    @When("ingreso en el campo de nombre de usuario con id {string} el texto {string}")
    public void ingreso_en_el_campo_de_nombre_de_usuario_con_id_el_texto(String fieldId, String text) {
        WebElement emailField = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(fieldId)));
        emailField.clear();
        emailField.sendKeys(text);
        System.out.println("Texto ingresado en el campo usuario: " + text);
    }

    @When("ingreso en el campo de contraseña con id {string} el texto {string}")
    public void ingreso_en_el_campo_de_contraseña_con_id_el_texto(String fieldId, String text) {
        WebElement passwordField = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(fieldId)));
        passwordField.clear();
        passwordField.sendKeys(text);
        System.out.println("Texto ingresado en el campo contraseña: " + text);
    }

    @When("hago clic en el botón de inicio de sesión con id {string}")
    public void hago_clic_en_el_boton_de_inicio_de_sesion_con_id(String buttonId) {
        WebElement loginButton = wait.until(ExpectedConditions.elementToBeClickable(By.id(buttonId)));
        loginButton.click();
        System.out.println("Haciendo clic en el botón de inicio de sesión.");
    }

    @Then("debería ser redirigido a la URL {string}")
    public void deberia_ser_redirigido_a_la_url(String expectedUrl) {
        boolean redirected = wait.until(ExpectedConditions.urlToBe(expectedUrl));
        if (redirected) {
            System.out.println("Redirigido exitosamente a la URL: " + expectedUrl);
        } else {
            throw new AssertionError("No redirigido a la URL esperada: " + expectedUrl);
        }
    }

    @Then("debería permanecer en la URL {string}")
    public void deberia_permanecer_en_la_url(String expectedUrl) {
        boolean onSameUrl = wait.until(ExpectedConditions.urlToBe(expectedUrl));
        if (onSameUrl) {
            System.out.println("Permanece en la URL esperada: " + expectedUrl);
        } else {
            throw new AssertionError("No se mantuvo en la URL esperada: " + expectedUrl);
        }
    }

    @Then("se presenta un mensaje de error {string}")
    public void se_presenta_un_mensaje_de_error(String expectedMessage) {
        try {
            WebElement errorElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[contains(text(),'" + expectedMessage + "')]")));
            String actualMessage = errorElement.getText();
            if (actualMessage.contains(expectedMessage)) {
                System.out.println("Mensaje de error encontrado: " + actualMessage);
            } else {
                throw new AssertionError("El mensaje de error no coincide. Esperado: " + expectedMessage + ", Actual: " + actualMessage);
            }
        } catch (Exception e) {
            throw new AssertionError("Mensaje de error no encontrado: " + expectedMessage);
        }
    }

    @Then("se presentan los mensajes de error:")
    public void se_presentan_los_mensajes_de_error(DataTable dataTable) {
        List<String> expectedMessages = dataTable.asList(String.class);
        boolean allMessagesFound = true;

        for (String expectedMessage : expectedMessages) {
            try {
                WebElement errorElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[contains(text(),'" + expectedMessage + "')]")));
                System.out.println("Mensaje de error encontrado: " + expectedMessage);
            } catch (Exception e) {
                System.out.println("Mensaje de error no encontrado: " + expectedMessage);
                allMessagesFound = false;
            }
        }

        if (!allMessagesFound) {
            throw new AssertionError("Algunos mensajes de error no fueron encontrados.");
        }
    }
    
}
