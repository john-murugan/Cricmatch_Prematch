Feature: My Wallet Functionality and Links

  Scenario: Verify "My Wallet" link presence and functionality
    Given the user is on any page
    Then the "My Wallet" link should be present
    When the user clicks on the "My Wallet" link
    Then the user should be redirected to the "My Wallet" page

  Scenario: Verify current account balance is displayed on "My Wallet" page
    Given the user is on the "My Wallet" page
    Then the current account balance should be displayed

  Scenario: Verify clicking on the Casino category in My Wallet redirects to the Casino page
    Given the user is on the "My Wallet" page
    When the user clicks on the Casino category
    Then the user should be redirected to the Casino page

  Scenario: Verify My Transactions category displays data
    Given the user is on the "My Wallet" page
    When the user clicks on the My Transactions category
    Then the transactions should display date, amount deposited, and success message

  Scenario: Verify "No Data" symbol displayed when no transactions are available
    Given the user is on the "My Wallet" page
    And there are no transactions available
    Then the "No Data" symbol should be displayed

  Scenario: Verify "Deposit Requests" tab is displayed correctly
    Given the user is on the "My Wallet" page
    Then the "Deposit Requests" tab should be displayed

  Scenario: Verify "Bonus Transactions" tab is displayed correctly
    Given the user is on the "My Wallet" page
    Then the "Bonus Transactions" tab should be displayed

  Scenario: Verify presence of links at the bottom of "My Wallet" page
    Given the user is on the "My Wallet" page
      
  Scenario: Verify footer links floating bar is not static
    Given the user is on the "My Wallet" page
    When the user scrolls up and down the page
    Then the footer links floating bar should not be static

  Scenario: Verify clicking on a footer link redirects to the respective page
    Given the user is on the "My Wallet" page
    When the user clicks on a footer link
    Then the user should be redirected to the respective page

  Scenario: Verify wallet balance reflects newly logged-in account without flickering
    Given the user has logged into a new account
    When the user navigates to the "My Wallet" page
    Then the wallet balance should reflect the new account amount without flickering

  Scenario: Verify back button redirects to My Wallet page from Sports page in mobile application
    Given the user is on the Sports page in the mobile application
    When the user clicks the back button
    Then the user should be redirected to the My Wallet page
