Feature: My Account Verification
  As a user
  User wants to verify the My Account section and its functionalities
  So that User can ensure everything is working as expected

  Background:
    Given User is logged into the application

  Scenario: Verify presence of My Account tile
    When User navigates to the Home Page
    Then User clicks on the My Account tile

  Scenario: Access My Account page
    And User should see the My Account tile in the top-left corner
    Then User should be redirected to the My Account page

  Scenario: Verify My Account page tabs
    Given User is on the My Account page
    Then User should see the Cash Balance and Your Unmatched Bets for Exchange tabs

  Scenario: Verify Cash Balance section
    Given User is on the My Account page
    When User navigates to the Cash Balance section
    Then User should see Cash Total, Exposure, Bonus, and Wager Target listed
    And the Cash Total and Available Balance amounts should be the same

  Scenario: Simple View in Cash Balance
    Given User is on the Cash Balance section
    When User clicks the Simple View option
    Then only the Cash Total should be displayed

  Scenario: Verify Your Unmatched Bets for Exchange section
    Given User is on the Your Unmatched Bets for Exchange section
    Then User should see the subtabs: Placed, Description, Type, Odds, Score, Stake (₹), Liability (₹), Potential Profit (₹), and Status
    And all monetary values should be indicated in Rupees

  Scenario: Verify Payment Activity subtabs
    Given User is on the Payment Activity tab
    Then User should see the subtabs: My Account, Deposit, Withdraw, My Wallet, and Transfer Fund

  Scenario: Verify Betting Activity subtabs
    Given User is on the Betting Activity tab
    Then User should see the subtabs: My Exchange Bets, My Sportsbook Bets, My Casino Bets, My Slot Bets, and My Tickets

  Scenario: Verify Promotions & Rewards tab
    Given User is on the Promotions & Rewards tab
    Then User should see the sections: Promotions, Refer and Earn, and Affiliates

  Scenario: Verify Settings menu options
    Given User is on the Settings menu
    Then User should see the options: Account Details, Last Login, Language, and Log Out

  Scenario: Access Account Details page from My Account subtab
    When User clicks on the My Account subtab within the Payment Activity tab
    Then User should be redirected to the Account Details page

  Scenario: Verify Account Details page tabs
    Given User is on the Account Details page
    Then User should see the tabs: "Details", "Personal Information", and "Marketing Preference"

  Scenario: Verify menu cards in My Account page
    Given User is on the "My Account" page
    Then User should see the menu cards: "Deposit", "Withdraw", "Open Bets", and "Settled Bets" in the right side section

  Scenario: Edit account details
    When User clicks the edit button in the top right corner of the "My Account" section
    Then User should be redirected to the account details edit page
    And the "User Name" field should not be editable

  Scenario: Change current password and set transaction password
    Given User is on the "Account Details" section
    When User changes the "Current Password"
    And User sets a "Transaction Password"
    Then the changes should be saved successfully

  Scenario: Change transaction password after initial setting
    Given User has previously set a "Transaction Password"
    When User changes the "Transaction Password" again
    Then the change should be successful

  Scenario: Verify Change Password section
    Given User is on the "Change Password" section
    Then User should see "Cancel" and "Save" buttons

  Scenario: Verify Change Transaction Password section
    Given User is on the "Change Transaction Password" section
    Then User should see "Cancel" and "Save" buttons

  Scenario: Set transaction password after registering with Google Mail
    Given User registered using Google Mail
    When User sets a "Transaction Password" in the "Account Details" section
    Then the change should be successful

  Scenario: Change transaction password second time after registering with Google Mail
    Given User registered using Google Mail
    When User changes the "Transaction Password" a second time in the "Account Details" section
    Then the change should be successful

  Scenario: Verify password eye icon
    Given User is on the "Change Current Password" field
    Then User should see the password eye icon
    Given User is on the "Change Transaction Password" field
    Then User should see the password eye icon

  Scenario: Enforce minimum password requirement
    Given User is on the "Change Current Password" field
    When User changes the password to a valid password with at least 8 characters
    Then User should be able to log in with the new password
    Given User is on the "Change Transaction Password" field
    When User changes the password to a valid password with at least 8 characters
    Then User should be able to log in with the new password

  Scenario: Enforce maximum password length
    Given User is on the "Change Current Password" field
    Then User should be limited to entering a maximum of 50 characters
    Given User is on the "Change Transaction Password" field
    Then User should be limited to entering a maximum of 50 characters

  Scenario: Enforce password complexity
    Given User is on the "Change Current Password" field
    When User changes the password to include at least one capital letter
    Then the change should be successful
    When User changes the password to include at least one number
    Then the change should be successful
    When User changes the password to include at least one special character
    Then the change should be successful
    Given User is on the "Change Transaction Password" field
    When User changes the password to include at least one capital letter
    Then the change should be successful
    When User changes the password to include at least one number
    Then the change should be successful
    When User changes the password to include at least one special character
    Then the change should be successful

  Scenario: Verify password setting after Google Mail registration
    Given User registered using Google Mail
    When User sets the password in the "Account Details" section
    Then the change should be successful

  Scenario: Verify Account Details page after switching accounts
    Given User logged into a Cricmatch account registered with a username and password
    And User accessed another account registered with Google Mail in a separate tab
    When User navigates back to the "Account Details" page
    Then User should see a single set of options in the "Market Preference" section without any duplication

  Scenario: Confirmation message for password changes
    When User successfully changes the current password in the "Account Details" section
    Then User should see a confirmation message "Password Changed Successfully"
    When User successfully changes the transaction password in the "Account Details" section
    Then User should see a confirmation message "Password Changed Successfully"

  Scenario: Validate phone number entry
    Given User is on the "Account Details" page
    When User enters their phone number
    Then it should be validated properly and only be entered once

  Scenario: Validate username display
    Given User is on the "Account Details" page
    Then the username should be displayed only once

  Scenario: Verify Payments label
    Given User is on the "Account Details" page
    Then User should see the "Payments" label correctly displayed in both the mobile app and web browser

  Scenario: Prompt for mobile number with Google Mail registration
    Given User signed in using Google Mail
    When User navigates to the "Account Details" page
    Then User should be prompted to "Enter Mobile Number"
