package com.pojo;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class Elements {

	private static Elements eleobj;
	private Elements() {
	
	}
	public static Elements getEleobj() {
		if(eleobj==null)
		{
			eleobj=new Elements();
		}
		return eleobj;
	}
	
	@FindBy(xpath = "//button[@class='login_setup']")
	private WebElement sign_in;
	
	@FindBy(id = "username")
	private WebElement username;
	
	@FindBy(id = "password")
	private WebElement password;
	
	@FindBy(xpath = "(//button[@class='register_btn'])[1]")
	private WebElement loginbutton;
	
	public WebElement getSign_in() {
		return sign_in;
	}
	public WebElement getUsername() {
		return username;
	}
	public WebElement getPassword() {
		return password;
	}
	public WebElement getLoginbutton() {
		return loginbutton;
	}
	
}
