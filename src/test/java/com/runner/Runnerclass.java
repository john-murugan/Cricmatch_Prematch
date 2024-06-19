package com.runner;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(features = "C:\\Users\\Kesavan R\\eclipse-workspace\\com.cricmatch\\src\\test\\resources\\Features\\CMS-30-US4_Ezugiprovider.feature", 
glue = {"Stepdefinition"} , dryRun = false,
monochrome = true)

public class Runnerclass {
		}


