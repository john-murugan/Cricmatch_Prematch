@Logout
Feature: Logout Functionality
  
  #TC-1,2
  @Logoutlink
  Scenario: Verify the logout button
    Given User logged in and on the homepage
    When user navigate to the My Account section
    Then user should see a Settings option
    Then user should see a Logout option
   
  #TC-3,4  
  @LogoutDialogBox
  Scenario: Verify the logout dialog box  
    When user click on the Logout option
    Then a logout dialog box should appear
    And the logout dialog box should contain Yes and No buttons
  
  #TC-5  
  @NoButton
  Scenario: Verify the No button from logout dialog box  
    When user click the No button in the dialog box
    Then the logout dialog box should close
    And user should remain logged in
  
  #TC-7,17 
  @YesButton&ConfirmMsg 
  Scenario: Verify the logout functionality  
    When user click on the Logout option
    And user click the Yes button in the dialog box
    Then user should be logged out of my account
    And user should see a confirmation prompt message saying You have logged out successfully