package DefinicionPasos;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;

import java.nio.file.Path;
import java.nio.file.Paths;

public class Configuracion {
	
	 private static final ThreadLocal<WebDriver> threadDriver = new ThreadLocal<>();

	    public static WebDriver configure() throws Exception {
	        if (threadDriver.get() == null) {
	            Path projectRoot = Paths.get(System.getProperty("user.dir"));
	            Path driverPath = projectRoot.resolve("src/test/resources/chrome/chromedriver.exe");

	            System.setProperty("webdriver.chrome.driver", driverPath.toString());
	            WebDriver driver = new ChromeDriver();
	            driver.manage().window().maximize();
	            driver.manage().deleteAllCookies();

				JavascriptExecutor executor = (JavascriptExecutor)driver;
				executor.executeScript("document.body.style.zoom = '0.5'");

	            threadDriver.set(driver);
	        }
	        return threadDriver.get();
	    }

	    public static void cerrarDriver() {
	        WebDriver driver = threadDriver.get();
	        if (driver != null) {
	            driver.quit();
	            threadDriver.remove(); // Limpia el `ThreadLocal` para evitar fugas de memoria
	        }
	    }
}
