package com.baseclass;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.browser.CommonBrowser;
import com.pojo.Elements;

public class ReuseFunction {

	private static ReuseFunction baseobj=null;
	private ReuseFunction() {
	
	}
	public static ReuseFunction getBaseobj() {
		if(baseobj==null)
		{
			baseobj=new ReuseFunction();
		}
		return baseobj;
	}
	

	FileInputStream file;
	String property;
	public String loadproperty(String Key)  {
		
		
		
		try {
			file = new FileInputStream(System.getProperty("user.dir")+"\\src\\test\\resources\\Constdata.properties");
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		}
		try {
			Properties prop= new Properties();
			prop.load(file);
			 property = prop.getProperty(Key);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return property;
	}
	
	public void implict() {
		CommonBrowser.getDriver().manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
	}
	
	public void explict(WebElement ele,int time) {
		WebDriverWait wait=new WebDriverWait(CommonBrowser.getDriver(), time);
		wait.until(ExpectedConditions.elementToBeClickable(ele));
	}
	public void initialize() {
		PageFactory.initElements(CommonBrowser.getDriver(), Elements.getEleobj());
	}
}
