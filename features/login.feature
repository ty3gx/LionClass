Feature: take in user log in information and route to class search page
 
  As a Columbia student
  So that I can easily put in my information to access the class searches
  I want to log in to the class enrollment page


Scenario: login link pressed

  When I am on the home page
  And I press "Log in"
  Then I should be on the calendar page
