package common.stepdefinition;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.stat.Stat;
import io.github.bonigarcia.wdm.WebDriverManager;

public class Browsersetup {

	private static WebDriver driver = null;

	public static void launchBrowser() {
		
		try {
			switch (Stat.BROWSER) {
			case "chrome":

//				LOGGER.info("Browser launching" + Stat.BROWSER);
				
				WebDriverManager.chromedriver().setup();
				driver = new ChromeDriver();
				driver.manage().window().maximize();
				break;
			case "Firefox":
				
				WebDriverManager.firefoxdriver().setup();
				driver = new FirefoxDriver();
				break;
			case "ie":
				
				WebDriverManager.edgedriver().setup();
				driver = new EdgeDriver();
				break;
			default:
				System.out.println("incorrect browser");
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static WebDriver getDriver() {
		return driver;
	}
	}


