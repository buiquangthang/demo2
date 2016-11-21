Feature: Authenticate
  In order to use the provided service
  As a User
  I wan to log in or log out my account

Scenario: User goes to the login page
  When I go to the home page
  And I click Login link on sidebar
  Then I must see the login page

Scenario: Successful Login
  Given I have an account
  When I log in
  Then I should see my profile page

Scenario: Unsuccessful Login
  When I login with invalid password
  Then I should see a message error

Scenario: Successful Logout
  Given I was login before
  When I click logout link
  Then I must see the home page