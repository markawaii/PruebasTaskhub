package DefinicionPasos;

import io.cucumber.java.en.And;
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

    @Then("Verificar que aparece el mensaje de éxito {string} en el elemento {string}")
    public void verificarQueApareceElMensajeDeÉxitoEnElElemento(String mensaje, String elemento) {
        try {
            WebElement elementoWeb = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.id(elemento)));
            elementoWeb.getText().equals(mensaje);
        } catch (Exception e) {
            throw new RuntimeException("Error al verificar la el mensaje en la ventana de exito: " + e.getMessage());
        }
    }

    @And("Aceptar la alerta")
    public void aceptarLaAlerta() {
        WebElement boton = wait.until(ExpectedConditions.elementToBeClickable(
                By.xpath("/html/body/div[3]/div/div[6]/button[1]")));
        boton.click();
    }

    @Then("Verificar que el proyecto se actualizó con el nombre {string}")
    public void verificarQueElProyectoSeActualizóConElNombre(String nuevoNombreDelProyecto) {
        try {
            WebElement elementoWeb =
                    wait.until(ExpectedConditions.visibilityOfElementLocated(
                            By.xpath("/html/body/div[1]/div/main/div/div/div[2]/div[1]/div/div/div[1]/div[2]")));

            if(!elementoWeb.getText().equals(nuevoNombreDelProyecto)) {
                throw new Exception("el nombre del proyecto no es igual ( "+elementoWeb.getText()+" con "+nuevoNombreDelProyecto+")");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al verificar el nombre del proyecto: " + e.getMessage());
        }
    }

    @Then("Verificar que el tipo de proyecto se actualizó a {string}")
    public void verificarQueElTipoDeProyectoSeActualizóA(String nuevoNombreDelProyecto) {
        try {
            WebElement elementoWeb =
                    wait.until(ExpectedConditions.visibilityOfElementLocated(
                            By.xpath("/html/body/div[1]/div/main/div/div/div[2]/div[1]/div/div/div[8]/div[2]")));

            if(!elementoWeb.getText().equals(nuevoNombreDelProyecto)) {
                throw new Exception("el nombre del proyecto no es igual ( "+elementoWeb.getText()+" con "+nuevoNombreDelProyecto+")");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al verificar el nombre del proyecto: " + e.getMessage());
        }
    }

    @Then("Verificar que el jefe de proyecto se actualizó a {string}")
    public void verificarQueElJefeDeProyectoSeActualizóA(String nuevoNombreDelProyecto) {
        try {
            WebElement elementoWeb =
                    wait.until(ExpectedConditions.visibilityOfElementLocated(
                            By.xpath("/html/body/div[1]/div/main/div/div/div[2]/div[1]/div/div/div[2]/div[2]")));

            if(!elementoWeb.getText().equals(nuevoNombreDelProyecto)) {
                throw new Exception("el nombre del proyecto no es igual ( "+elementoWeb.getText()+" con "+nuevoNombreDelProyecto+")");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al verificar el nombre del proyecto: " + e.getMessage());
        }
    }

    @And("Seleccionar la opcion {string} del selector con id {string}")
    public void seleccionarLaOpcionDelSelectorConId(String opcion, String id) {
        seleccionarOpcionEnLista(id, Integer.parseInt(opcion), "jefe de proyecto");
    }

    private void seleccionarOpcionEnLista(String id, int opcion, String campo) {
        WebElement selectElement = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
        Select select = new Select(selectElement);
        if (!select.getOptions().isEmpty()) {
            select.selectByIndex(opcion);
        } else {
            throw new AssertionError("No hay opciones disponibles para seleccionar en el selector de " + campo + " opcion "+opcion+".");
        }
    }

    @And("Modificar la fecha con el campo {string} del proyecto a {string}")
    public void modificarLaFechaConElCampoIdCampoDelProyectoAString(String idCampo, String fecha) {
        try {
            WebElement campoNombre = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(idCampo)));
            campoNombre.clear();
            campoNombre.sendKeys(fecha);
            campoNombre.sendKeys(Keys.ESCAPE);
        } catch (Exception e) {
            throw new RuntimeException("Error al cambiar la fecha del proyecto: " + e.getMessage());
        }
    }

    @Then("Verificar que fecha de inicio proyecto se actualizó a {string}")
    public void verificarQueFechaDeInicioProyectoSeActualizóA(String arg0) {
        try {
            WebElement elementoWeb =
                    wait.until(ExpectedConditions.visibilityOfElementLocated(
                            By.xpath("/html/body/div[1]/div/main/div/div/div[2]/div[1]/div/div/div[4]/div[2]")));

            if(!elementoWeb.getText().equals(arg0)) {
                throw new Exception("la fecha de termino del proyecto no es igual ( "+elementoWeb.getText()+" con "+arg0+")");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al verificar la fecha de termino del proyecto: " + e.getMessage());
        }
    }

    @Then("Verificar que fecha de termino proyecto se actualizó a {string}")
    public void verificarQueFechaDeTerminoProyectoSeActualizóA(String arg0) {
        try {
            WebElement elementoWeb =
                    wait.until(ExpectedConditions.visibilityOfElementLocated(
                            By.xpath("/html/body/div[1]/div/main/div/div/div[2]/div[1]/div/div/div[5]/div[2]")));

            if(!elementoWeb.getText().equals(arg0)) {
                throw new Exception("la fecha de termino del proyecto no es igual ( "+elementoWeb.getText()+" con "+arg0+")");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error al verificar la fecha de termino del proyecto: " + e.getMessage());
        }
    }

    @And("Permanecer en la vista de modificaion de proyectos {string}")
    public void permanecerEnVistaCreacion(String url) {
        String currentUrl = driver.getCurrentUrl();
        if (!currentUrl.equals(url)) {
            throw new AssertionError("URL esperada: " + url + ", pero se encontró: " + currentUrl);
        }
    }

    @And("Aceptar la alerta de éxito")
    public void aceptarLaAlertaDeÉxito() {
        try {
            WebElement boton = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("/html/body/div[3]/div/div[6]/button[1]")));
            boton.click();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al confirmar la eliminacion el proyecto: " + e.getMessage());
        }
    }
}
