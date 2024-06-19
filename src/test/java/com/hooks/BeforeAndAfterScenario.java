package com.hooks;

import org.openqa.selenium.WebDriver;
import com.baseclass.ReuseFunction;
import com.browser.CommonBrowser;
import com.pojo.Elements;

import io.cucumber.java.After;
import io.cucumber.java.Before;

public class BeforeAndAfterScenario {

	WebDriver dr;
	@Before
	public void beforeScenario() throws Throwable {
	
		if(dr==null)
		{
			CommonBrowser.launchbrowser();
		}
		ReuseFunction.getBaseobj().initialize();
		CommonBrowser.getDriver().manage().window().maximize();
		CommonBrowser.getDriver().get(ReuseFunction.getBaseobj().loadproperty("URL"));
		Thread.sleep(10000);
		Elements.getEleobj().getSign_in().click();
		Thread.sleep(3000);
		Elements.getEleobj().getUsername().click();
		Thread.sleep(3000);
		Elements.getEleobj().getPassword().click();
		Thread.sleep(3000);
		Elements.getEleobj().getLoginbutton().click();
	}
	
	@After
	public void afterScenario() {
		CommonBrowser.getDriver().close();
	}
}
