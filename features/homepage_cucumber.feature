Feature: Home Page
  As a user
  I want to go to the homepage
  So that I can see homepage

Scenario: User sees the welcome message
  When I go to the homepage
  Then I should see the welcome message

Scenario: User sees some link
  When I go to the homepage
  Then I should see the Sign up link
  Then I should see the Login link