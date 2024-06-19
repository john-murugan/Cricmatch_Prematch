Feature: Casino Menu and Homepage Functionality

  Scenario: User clicks on the "Casino" menu option
    When the user clicks on the "Casino" menu option
    Then they should be redirected to the casino homepage

  Scenario: Check "Casino" menu option is prominently displayed in the main navigation bar
    Given the user is on any page
    Then the "Casino" menu option should be prominently displayed in the main navigation bar

  Scenario: Check the menu option is easily identifiable and accessible from any page within the website
    Given the user is on any page
    Then the main menu option should be displayed on all pages

  Scenario: Check Promotional banners or important announcements are displayed on the casino homepage
    Given the user is on the casino homepage
    Then Promotional banners or important announcements should be prominently displayed on the casino homepage

  Scenario: User clicks on the casino categories
    When the user clicks on the casino categories
    Then the user should be redirected to the corresponding page

  Scenario: User clicks on the providers
    When the user clicks on the providers
    Then it should redirect the user to the corresponding provider's games

  Scenario: User clicks on the game banners
    When the user clicks on the game banners
    Then it should redirect the user to the corresponding game page

  Scenario: Account balance is zero and user clicks on the game
    Given the account balance is zero
    When the user clicks on the game
    Then it should display a Low Balance popup

  Scenario: User clicks on the candy box icon
    When the user clicks on the candy box icon
    Then it should redirect the user to the list of providers page

  Scenario: Check the payment methods are displayed at the bottom of the page
    Given the user is on the casino homepage
    Then the payment methods should be displayed at the bottom of the page

  Scenario: Check the user is able to access game providers on the casino homepage
    Given the user is on the casino homepage
    Then the user should be able to access all the game providers on the casino homepage

  Scenario: Check the title for each category of games on the casino page
    Given the user is on the casino homepage
    Then the title for each category of games on the casino page should be displayed

  Scenario: Validate the information icon on the casino homepage
    Given the user is on the casino homepage
    When the user clicks on the information icon
    Then the icon should show the correct information

  Scenario: User clicks on the home button in the footer of the casino page
    When the user clicks on the home button in the footer of the casino page
    Then the home page should be displayed

  Scenario: User scrolls up and down the page of the casino homepage
    Given the user is on the casino homepage
    When the user scrolls up and down the page
    Then there should be no overlap issue displayed

  Scenario: User clicks on Ezugi games on the live casino page
    When the user clicks on Ezugi games on the live casino page
    Then it should navigate to their respective game page