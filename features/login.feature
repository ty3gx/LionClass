Feature: take in user log in information and route to class search page
 
  As a Columbia student
  So that I can easily put in my information to access the class searches
  I want to log in to the class enrollment page


Scenario: Login Fails - Unregistered

	When I am on the home page
	And I put email as new@gmail.com
	And I put password as PASSWORD
	And I click login
	Then the login should fail


Scenario: Register link pressed

	When I am on the home page
	And I press "Register"
	Then I should be on the register page


Scenario: Register Success

	When I go to the register page
	And I put username as JJ
	And I put email as jj@gmail.com 
	And I put password as PASSWORD
	And I put password-confirm as PASSWORD
	And I click register
	Then the register should be successful


Scenario: Register Fails - blank details

	When I go to the register page
	And I enter blank details for Register
	And I click register
	Then the register should fail


Scenario: Login Success - registered user with valid password

	When I go to the login page
	And I put email as jj@gmail.com 
	And I put password as PASSWORD
	And I click login
	Then the login should be successful


Scenario: Login Fails - registered user with invalid password

	When I go to the login page
	And I put email as jj@gmail.com 
	And I put password as WRONG
	And I click login
	Then the login should fail

