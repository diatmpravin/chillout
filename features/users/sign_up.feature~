Feature: Registration
	If i want to access protect sections of the site
	As a users
	I want to sign up
	
	Background:
		Given I am not logged in
	
	Scenario: User signs up with valid data
		When I sign up with valid user data
		Then I should see a successful sign up message
		
	Scenario: User signs up with invalid email
		When I sign up with a invalid email
		Then I should see an invalid email message	
		
	Scenario: User signs up without password
		When I signs up wihtout password
		Then I should see a missing password message
		
	Scenario: User signs up without password confirmation
		When I sign up without a password confirmation
		Then I should see a missing password confirmation
		
	Scenario: User signs up with mismatched password and password confirmation
			When I signs up mismatched password confirmation
			Then I should see mismatched password
