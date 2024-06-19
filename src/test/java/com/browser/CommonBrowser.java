package com.browser;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;

import com.baseclass.ReuseFunction;
import io.github.bonigarcia.wdm.WebDriverManager;

public class CommonBrowser {

	private  static WebDriver driver=null;
	
	public static void launchbrowser() throws Throwable {
		switch (ReuseFunction.getBaseobj().loadproperty("BROWSER")) {
		case "CHROME":
			WebDriverManager.chromedriver().setup();
			driver=new ChromeDriver();
			break;
			
		case "FIREFOX":
			WebDriverManager.firefoxdriver().setup();
			driver=new FirefoxDriver();
			break;
			
		case "IE":
			WebDriverManager.iedriver().setup();
			driver=new InternetExplorerDriver();
			break;

		default:
			System.out.println("NO BROWSER");
			break;
		}
	}
	public static WebDriver getDriver() {
		return driver;
	}
}
