package com.cucumber_runner;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)

@CucumberOptions(
		features = "src/test/resources/features",
		glue = "com.cucumber_step_Definition",
		dryRun = false,
		monochrome = true,
		tags = "@multiitemCart",
		plugin = {//"com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:",
				"io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm",
				"rerun:target/failedrerun.txt",
				"pretty",
		        "html:target/cucumber-reports/cucumber.html", 
		        "json:target/cucumber-reports/cucumber.json", },
		publish = true
		
		)
public class Runner {

}

