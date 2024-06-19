Feature: Transfer Fund functionality
 
  Scenario: Verify Transfer Fund link presence and functionality
    Given the user is logged into the application
    When the user navigates to the homepage
    Then the Transfer Fund link should be present
    When the user clicks on the Transfer Fund link
    Then a dialog box prompting to create a transaction password is opened
 
  Scenario: Verify dialog box closes when clicking outside
    Given the dialog box prompting to create a transaction password is opened
    When the user clicks outside the dialog box area
    Then the dialog box should close
 
  Scenario: Verify redirection to transaction password page
    Given the dialog box prompting to create a transaction password is opened
    When the user clicks on the create transaction password button
    Then the user should be redirected to the Account details page for setting the transaction password
 
  Scenario: Verify redirection to transfer fund page after setting transaction password
    Given the user is on the Account details page for setting the transaction password
    When the user sets a transaction password successfully
    Then the user should be redirected to the transfer fund page
 
  Scenario: Verify transfer fund page elements
    Given the user is on the transfer fund page
    Then the account balance should be displayed
    And the transfer form should be present with the amount input field
    And the To text box with placeholder should be present
    And the Verify user button should be visible
 
  Scenario: Verify error message for amount less than Rs 100
    Given the user is on the transfer fund page
    When the user enters an amount less than Rs 100
    And clicks on the Transfer button
    Then an error message indicating Minimum transfer amount is Rs 100 should be displayed
 
  Scenario: Verify Required error message for cleared amount field
    Given the user is on the transfer fund page
    When the user enters an amount
    And then clears the amount field
    Then the error message Required should be displayed
 
  Scenario: Verify P2P transfer using username, email, and phone number
    Given the user is on the transfer fund page
    When the user enters a valid username in the To field
    And clicks on the Verify user button
    Then the user should be verified successfully
    When the user enters a valid email in the To field
    And clicks on the Verify user button
    Then the user should be verified successfully
    When the user enters a valid phone number in the To field
    And clicks on the Verify user button
    Then the user should be verified successfully
    And the transfer should complete with a confirmation message
 
  Scenario: Verify error popup for incorrect username
    Given the user is on the transfer fund page
    When the user enters an incorrect username in the To field
    And clicks on the Verify user button
    Then an error popup indicating Player Not Found should be displayed
 
  Scenario: Verify error for empty transaction password fields
    Given the user is on the transfer fund page
    When the user leaves the transaction password fields empty
    And clicks on the Transfer button
    Then an error message indicating Password Field Should not be Blank should be displayed
 
  Scenario: Verify error for empty username and To field
    Given the user is on the transfer fund page
    When the user leaves the username and To field empty
    And clicks on the Transfer button
    Then an error message indicating Required should be displayed
 
  Scenario: Verify error for insufficient balance
    Given the user is on the transfer fund page
    And the users account balance is less than the entered amount
    When the user clicks on the Transfer button
    Then an error popup indicating insufficient fund should be displayed
 
  Scenario: Verify error popup for incorrect transaction password
    Given the user is on the transfer fund page
    When the user enters an incorrect transaction password
    And clicks on the Transfer button
    Then an error popup indicating Incorrect password should be displayed
 
  Scenario: Verify phone number without country code in To field
    Given the user is on the transfer fund page
    When the user enters a phone number without the country code in the To field
    And clicks on the Verify user button
    Then an error popup indicating Player Not Found should be displayed
    When the user enters a phone number with the country code in the To field
    And clicks on the Verify user button
    Then the user should be verified successfully
 
  Scenario: Verify amount field accepts numeric input up to two decimal places
    Given the user is on the transfer fund page
    When the user enters a numeric amount in the amount field
    Then the amount field should accept input up to two decimal places
    And the amount field should not accept more than two decimal places
    And the system should reject any input with more than two decimal places with an error message