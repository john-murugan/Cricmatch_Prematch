package org.stepdefinition;

import org.baseclass.BaseClass;
import org.commonbrowser.CommonBrowser;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import io.cucumber.java.AfterStep;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;

public class CommonStepdefinition {
	
	@Before
	public void beforeScenario() throws Throwable {
     BaseClass.getInstance().loadproperties();
     CommonBrowser.launchBrowser();
     BaseClass.getInstance().getUrl();
	}
	@AfterStep
	public void screenShot(Scenario scenario) {
      if (scenario.isFailed()) {
    	      byte[] screenshotAs = ((TakesScreenshot)CommonBrowser.getDriver()).getScreenshotAs(OutputType.BYTES);
    	      scenario.attach(screenshotAs, "image/png", "errorevidence");
		
	}
	}

}
