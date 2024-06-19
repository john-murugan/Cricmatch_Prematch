package org.runnerclass;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src\\test\\resources\\CricmatchFeature\\Cricmatch.feature", glue = {
"com.hooks" , "org.stepdefinition"},
plugin = {"com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:"})



public class RunnerClass {

}
