Feature: Edit User
  I am able to edit my profile
  As a registered user
  I want to edit my profile
  
    Scenario: I want to edit my profile
      Given I am logged in
      When I edit my account details
      Then I should see an account edited message
