Feature: Deposit functionality
 
  Scenario: Verify redirection to Deposit page and options
    Given the user is logged into the application
    When the user clicks the Deposit button under my account
    Then the user should be redirected to the Deposit page
    And Instant methods and Bank transfer options should be displayed
 
  Scenario: Verify available Instant Method options
    Given the user is on the Deposit page
    When the user checks the available Instant Method options
    Then UPI, Net Banking, Credit Card, Debit Card, and Wallet options should be available
 
  Scenario: Verify available Bank Transfer options
    Given the user is on the Deposit page
    When the user checks the available Bank Transfer options
    Then Bank Transfer, Phonepe, Paytm, Amazon Pay, BHIM, and IMPS/RTGS/NEFT options should be displayed
 
  Scenario: Review payment information under Instant deposit methods
    Given the user is on the Deposit page
    When the user reviews the payment information under all the instant deposit methods
    Then respective processing time and any applicable fee information should be displayed for each instant method
 
  Scenario: Review payment information under Bank transfer methods
    Given the user is on the Deposit page
    When the user reviews the payment information under all Bank transfer methods
    Then respective processing time, any applicable fee, account number, name, and IFSC code information should be displayed for each Bank transfer method
 
  Scenario: Enter amount outside valid range
    Given the user is on the Deposit page
    When the user enters an amount of Rs 50
    Then an error message indicating the valid range (Rs 100 to Rs10,00,000) should be displayed
    When the user enters an amount of Rs 15,00,000
    Then an error message indicating the valid range (Rs 100 to Rs 10,00,000) should be displayed
 
  Scenario: Verify presence of Deposit button on Instant methods page
    Given the user is on the Deposit page
    When the user navigates to the Instant methods section
    Then the Deposit button should be displayed
 
  Scenario: Verify Deposit via instant methods functionality with valid input range
    Given the user is on the Deposit page
    When the user selects an instant method
    And enters a valid amount within the range of Rs 100 to Rs 10,00,000
    And clicks on the Deposit button
    Then a successful deposit popup should be displayed
 
  Scenario: Verify Proceed to pay button on Bank transfer page
    Given the user is on the Deposit page
    When the user navigates to the Bank transfer section
    Then the Proceed to pay button should be displayed
 
  Scenario: Verify Deposit via bank transfer functionality with valid input range
    Given the user is on the Deposit page
    When the user selects a bank transfer method
    And enters a valid amount within the range of Rs 100 to Rs 10,00,000
    And clicks on the Proceed to pay button
    Then the user should see the deposit amount field pre-filled with the previously entered amount
    And a field to enter the reference number
 
  Scenario: Verify Video instructions presence
    Given the user is on the Deposit page
    When the user navigates to the Bank transfer section
    Then a video instruction should be attached below the deposit form to guide users through the payment process
 
  Scenario: Verify handling of failed payments
    Given the user is on the Deposit page
    When a payment fails
    Then the user should receive an error message detailing the issue
    And suggesting possible solutions
 
  Scenario: Verify footer payment content
    Given the user is on the Deposit page
    When the user scrolls to the footer
    Then the payment content should be related to the Cricmatch application
 
  Scenario: Verify deposit through homepage deposit option
    Given the user is on the homepage
    When the user clicks on the homepage deposit option
    And enters a valid amount within the range of Rs 100 to Rs 10,00,000
    Then the user should be directed to the Deposit page with the specified amount pre-filled
 
  Scenario: Verify decimal input in deposit field
    Given the user is on the Deposit page
    When the user enters a decimal amount (e.g., 99.30) in the "Enter Amount" field
    Then the field should accept the decimal value
 
  Scenario: Verify restriction on non-numeric input in deposit field
    Given the user is on the Deposit page
    When the user tries to enter a non-numeric value in the "Enter Amount" field
    Then the field should only allow numerical values, whether with or without a decimal point
 
  Scenario: Verify character keypad access for UTR number
    Given the user is on the bank transfers enter reference number page
    When the user tries to enter the UTR number
    Then the user should be able to access both the character keypad and the number pad
 
  Scenario: Verify instruction video on UTR number page
    Given the user is on the bank transfers enter reference number page
    When the user scrolls the page
    Then the instruction video should be displayed above the bottom navigation bar
    And the user should be able to view the full video without any overlap or merging with the navigation bar