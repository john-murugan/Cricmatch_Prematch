Feature: Bet History and Related Actions

   Scenario: Accessing Bet History Page
    When the user navigates to the main menu
    And the user clicks on "Bet History"
    Then the bet history page is displayed

   Scenario: Verifying Entries in Bet History List
    Given the user is on the bet history page
    Then each entry in the bet history list includes the date, event, bet type, stake, and outcome
    And there are no missing or incomplete entries in the list

  Scenario: Using the Date Range Filter
    Given the user is on the bet history page
    When the user clicks on "Select From Date"
    Then any previously prefilled dates are cleared
    When the user clicks on "Select To Date"
    Then any previously prefilled dates are cleared
    And the user selects a date range
    Then the bet history list displays entries within the selected date range

  Scenario: Navigating Through Bet History Pages
    Given the user is on the bet history page
    When the user clicks on the "Next" button to view more entries
    Then the website displays the next page of the bet history list
    When the user clicks on the "Previous" button to view previous entries
    Then the website displays the previous page of the bet history list

  Scenario: Comparing Bet History with Known Past Activity
    Given the user is on the bet history page
    Then the user can compare the bet history entries with their known past activity
    And the entries should match the user's known past activity

  Scenario: Selecting a Provider from the List
    When the user clicks on the balance amount in the top right corner
    Then the user can see a list of providers
    When the user selects a provider from the list
    And the user clicks on the balance amount in the top right corner again
    Then the user's balance amount is updated according to the selected provider

  Scenario: Scrolling on an Empty Betting History Page
    Given the user is on the bet history page
    And the bet history list is empty
    When the user attempts to scroll down the page
    Then the page remains stationary and does not scroll down
    When the user attempts to scroll up the page
    Then the page remains stationary and does not scroll up