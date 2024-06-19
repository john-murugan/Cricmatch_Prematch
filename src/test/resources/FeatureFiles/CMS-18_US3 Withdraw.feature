@Withdraw
Feature: Withdraw page

#TC-01,13,2,3,8,4
@Errormessage
Scenario: Verify Withdraw page functionalities
    Given I am on the My Account page
    Then I should see the Withdraw link
    When I click on the Withdraw link
    Then I should be redirected to the Withdraw page
    And the Withdraw page should load within two seconds
    And the Withdraw page should display the input fields
    And the Withdraw page input fields should have placeholders     
    When I fill the form with incorrect data or empty fields
    And I submit the form
    Then I should see error messages for each field with incorrect data

#9
@AmountField
Scenario Outline: Verify withdrawal amount field accepts only numeric values
    Given I am on the Withdraw page
    When I enter amount "<Value>" into the withdrawal amount field
    And I submit the form
    Then I should see result for the amount "<Value>"

    Examples:
      |amountValue          |
      |Only alphabets       |
      |Only numberic        |
      |Negative numberic    |
      |Alphanumberic        |
      |Special character    |

#12
@AccountNumber
Scenario Outline: Verify account number field accepts only numeric values
    Given I am on the Withdraw page
    When I enter accNo "<Value>" into the account number field
    And I submit the form
    Then I should see result for the accNo "<Value>"

    Examples:
      | accNoValue             | 
      | only numeric           |
      | only alphabet          |
      | alphanumeric           |
      | only special character | 
      | numeric with decimal   |

#16
@IFSCcode
Scenario Outline: Verify IFSC code field accepts only valid alphanumeric codes
    Given I am on the Withdraw page
    When I enter ifsc "<Value>" into the IFSC code field
    And I submit the form
    Then I should see result for the ifsc "<Value>"

    Examples:
      | ifscValue                        |
      | Only numeric                     | 
      | only alphabet                    | 
      | alphanumeric                     |
      | alphanumberic with spl character |


#18,11,22
@WithdrawAmount
Scenario: Verify withdrawal amount constraints
    Given I am on the Withdraw page
    When I enter fifty into the withdrawal amount field
    And I submit the form
    Then I should see Amount must be at least Hundred Rupees

    When I enter more then ten lakh into the withdrawal amount field
    And I submit the form
    Then I should see Amount exceeds the maximum limit of ten lakh Rupees

    When I enter more than my balance into the withdrawal amount field
    And I submit the form
    Then I should see Amount exceeds available balance

#5,7,24,14
@WithdrawSuccess
Scenario: Verify withdrawal processing securely
    Given I am on the Withdraw page
    When I enter valid data in the all fields
    And I submit the form
    Then the withdrawal request should be processed securely

    Then verify my account balance should update immediately.

    Then I should see a prompt popup
    And I click the History button in the prompt
    Then I should be redirected to the History page

    #Given I am on the "My Wallet" page
    Then I should see the withdrawal details under respective withdrawals
 

#17,20
@AccountSelection
Scenario: Verify redirection using the back button and retention of selected account details and responsive fields
    Given I am on the Withdraw page
    When I add two account details via withdrawal
    Then i reload the page
    When I click the back button in withdraw page
    Then I should be redirected to the previous page within the withdrawal section

    And I have selected any account detail
    And verify selected account details should filled in fields and not editable.

#23
@AmountFieldValidation
Scenario: Verify input restrictions for withdrawal amount field
    Given I am on the Withdraw page
    When I enter decimal "<value>" into withdrawal amount field
    Then I see result for the decimal "<value>"
    
    Examples:
    |decimal value|
    |100.0597|
    |101.67.67|
    |109.33|
  
#21
@RetentionFilledData
Scenario: Verify retention of filled withdrawal details after navigating away and returning
    Given I am on the Withdraw page
    When I enter data in the all fields
    When I navigate away from the withdrawal page
    And return to the Withdraw page
    Then the filled information stays visible
    And i can still type in new details
