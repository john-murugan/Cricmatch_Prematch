package org.baseclass;

import java.awt.AWTException;
import java.awt.Font;
import java.awt.Robot;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import javax.swing.GroupLayout.Alignment;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.poi.openxml4j.util.ZipSecureFile;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.commonbrowser.CommonBrowser;
import org.constant.Constant;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;





public class BaseClass {

	private static BaseClass baseclassinstance = null;

	private BaseClass() {
	}

	public static BaseClass getInstance() {
		if (baseclassinstance == null) {
			baseclassinstance = new BaseClass();
		}
		return baseclassinstance;
	}

	public void loadproperties() {
		Properties properties = new Properties();
		try {
			properties.load(getClass().getResourceAsStream("/Config.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		Constant.APP_URL = properties.getProperty("APP_URL");
		Constant.BROWSER = properties.getProperty("BROWSER");
		Constant.USERNAME = properties.getProperty("USERNAME");
		Constant.PASSWORD = properties.getProperty("PASSWORD");
	}

	

	public void getUrl() throws Throwable {
		try {
			CommonBrowser.getDriver().get(Constant.APP_URL);
			CommonBrowser.getDriver().manage().timeouts().implicitlyWait(3, TimeUnit.SECONDS);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public String getTitle() {
		try {
			String title = CommonBrowser.getDriver().getTitle();
			return title;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public String getCurrentUrl() {
		try {
			String title = CommonBrowser.getDriver().getCurrentUrl();
			return title;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public void sendkeys(WebElement elementlocator, String inputvalue) {
		try {
			elementlocator.sendKeys(inputvalue);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}

	}

	// Actions
	public void dragAndDrop(WebElement dragelementlocator, WebElement dropelementlocator) {
		try {

			Actions ac = new Actions(CommonBrowser.getDriver());
			ac.dragAndDrop(dragelementlocator, dropelementlocator).build().perform();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public void dropdown(WebElement dropdownlocator, String dropdownmethod, String dropdownvalue) {
		try {
			Select sc = new Select(dropdownlocator);
			if (dropdownmethod.equalsIgnoreCase("value")) {
				sc.selectByValue(dropdownvalue);
			} else if (dropdownmethod.equalsIgnoreCase("visibletext")) {
				sc.selectByVisibleText(dropdownvalue);
			} else if (dropdownmethod.equalsIgnoreCase("index")) {
				sc.selectByIndex(Integer.parseInt(dropdownvalue));
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}

	}

	public void droganddropwithoffset(WebElement dragandroporrezizelocator, int ofsetvalueX, int offsetvalueY) {
		try {

			Actions ac = new Actions(CommonBrowser.getDriver());
			ac.clickAndHold(dragandroporrezizelocator);
			Thread.sleep(2000);
			ac.moveByOffset(ofsetvalueX, ofsetvalueX).release().build().perform();

			// ac.perform();

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}

	}


	public void explicitWait(WebElement element, int sec) {
		try {
			WebDriverWait wait = new WebDriverWait(CommonBrowser.getDriver(), sec);
			wait.until(ExpectedConditions.elementToBeClickable(element));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}

	}

	public void switchtoSecondWindow() {
		try {
			String parentwindow = CommonBrowser.getDriver().getWindowHandle();
			Set<String> allwindows = CommonBrowser.getDriver().getWindowHandles();
			for (String x : allwindows) {
				if (!x.equals(parentwindow)) {
					CommonBrowser.getDriver().switchTo().window(x);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void switchtoMultipleWindow(int index) {
		try {
			String cId = CommonBrowser.getDriver().getWindowHandle();
			Set<String> pId = CommonBrowser.getDriver().getWindowHandles();
			List<String> li = new ArrayList<String>();
			li.addAll(pId);
			CommonBrowser.getDriver().switchTo().window(li.get(index));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}

	}

	public void switchtoDefualtContent() {
		try {
			CommonBrowser.getDriver().switchTo().defaultContent();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String randomeString(int stringcount) {
		String generatedString = RandomStringUtils.randomAlphabetic(stringcount);
		return (generatedString);
	}

	public String randomNumber(int numcount) {
		String generatedString2 = RandomStringUtils.randomNumeric(numcount);
		return (generatedString2);
	}

	public String randomAlphaNumber(int numcount, int Stringcount) {
		String st = RandomStringUtils.randomAlphabetic(Stringcount);
		String num = RandomStringUtils.randomNumeric(numcount);
		return (st + "@" + num);
	}

	public String randomAlphaNumberswspcase(int numcount, int Stringcount) {
		String st = RandomStringUtils.randomAlphabetic(Stringcount);
		String num = RandomStringUtils.randomNumeric(numcount);
		return (st + num);
	}

	public String randomNumberbelowtend() {
		String generatedString2 = RandomStringUtils.randomNumeric(1);
		return (generatedString2);
	}

	public static void implicitWait(int a) {
		CommonBrowser.getDriver().manage().timeouts().implicitlyWait(a, TimeUnit.SECONDS);
	}

	public WebElement getToasterMessage(WebElement element, int sec) {

		try {
			WebDriverWait wait = new WebDriverWait(CommonBrowser.getDriver(), sec);
			WebElement text = wait.until(ExpectedConditions.visibilityOf(element)); // Changed to elementToBeVisible
			return text;

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public void click(WebElement elementlocator) {
		try {

			elementlocator.click();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public String getText(WebElement elementlocator) {
		try {
			String text = elementlocator.getText();
			return text;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public String getElementTextAttribute(WebElement element, String value) {
		try {
			String attribute = element.getAttribute(value);
			return attribute;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public void scrollUpandScrollDownusingElement(WebElement elementlocator) {
		try {
			JavascriptExecutor js = (JavascriptExecutor) CommonBrowser.getDriver();
			js.executeScript("arguments[0].scrollIntoView();", elementlocator);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public static void scrollUpandDownusingCoordinates(int top, int height) {
		try {
			JavascriptExecutor js = (JavascriptExecutor) CommonBrowser.getDriver();
			js.executeScript("window.scrollBy(" + top + "," + height + ")");
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public void scrolltoBottomPage() {
		try {
			JavascriptExecutor js = (JavascriptExecutor) CommonBrowser.getDriver();
			js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public void movetoElement(WebElement elementlocator) {
		try {
			Actions ac = new Actions(CommonBrowser.getDriver());
			ac.moveToElement(elementlocator).build().perform();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public void doubleClick(WebElement element) {
		try {
			Actions ac = new Actions(CommonBrowser.getDriver());
			ac.doubleClick(element).build().perform();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public void contextClick(WebElement element) {
		try {
			Actions ac = new Actions(CommonBrowser.getDriver());
			ac.contextClick(element).build().perform();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public void elementClickusingActions(WebElement element) {
		try {
			Actions ac = new Actions(CommonBrowser.getDriver());
			ac.click(element).build().perform();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();

		}
	}

	public void robotKeyboardAction(int keyCode) {
		try {
			Robot robot = new Robot();
			robot.keyPress(keyCode);
			robot.keyRelease(keyCode);
		} catch (AWTException e) {
			e.printStackTrace();
		}
	}

	public void highlightElement(WebElement element) {
		try {
			String originalStyle = element.getAttribute("style");
			JavascriptExecutor js = (JavascriptExecutor) CommonBrowser.getDriver();
			js.executeScript("arguments[0].setAttribute('style', 'background: yellow; border: 2px solid red;');",
					element);

			Thread.sleep(1000);
			js.executeScript("arguments[0].setAttribute('style', '" + originalStyle + "');", element);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	public void performMouseHover(WebElement element) {
		try {
			Actions actions = new Actions(CommonBrowser.getDriver());
			actions.moveToElement(element).perform();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void performRightClick(WebElement element) {
		try {
			Actions actions = new Actions(CommonBrowser.getDriver());
			actions.contextClick(element).perform();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void navigateToURL(String url) {
		try {
			CommonBrowser.getDriver().navigate().to(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void switchtoIframe(String options, Object value) {
		try {
			if (options.equalsIgnoreCase("index")) {
				CommonBrowser.getDriver().switchTo().frame(Integer.parseInt((String) value));
			} else if (options.equalsIgnoreCase("name")) {
				CommonBrowser.getDriver().switchTo().frame((String) value);
			} else if (options.equalsIgnoreCase("element")) {
				CommonBrowser.getDriver().switchTo().frame((WebElement) value);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}

	public void closeAndSwitchToFirstTab() {
		// Close the current tab
		CommonBrowser.getDriver().close();

		// Switch back to the first tab (index 0)
		CommonBrowser.getDriver().switchTo().window(CommonBrowser.getDriver().getWindowHandles().iterator().next());
	}
}

