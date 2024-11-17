package DefinicionPasos;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.nio.file.Path;
import java.nio.file.Paths;

public class Configuracion {

    private static WebDriver driver; // Convertido a privado

    public static WebDriver configure() throws Exception {
        if (driver == null) { // Crear el driver solo si no existe
            Path projectRoot = Paths.get(System.getProperty("user.dir"));
            Path driverPath = projectRoot.resolve("src/test/resources/chrome/chromedriver.exe");

            System.setProperty("webdriver.chrome.driver", driverPath.toString());
            driver = new ChromeDriver();
            driver.manage().window().maximize();
            driver.manage().deleteAllCookies();
        }
        return driver;
    }

    public static void cerrarDriver() {
        if (driver != null) {
            driver.quit();
            driver = null; // Restablecer la instancia
        }
    }
}
