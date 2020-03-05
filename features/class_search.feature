Feature: take in user log in information and route to class search page
 
  As a Columbia student
  So that I can enroll in classes that I need
  I want to find out all class information and reviews


Background: classes have been added to database

  Given the following courses exist:
  | call  | title                       | number    | sec | instructor   | day   | time          | location  | period                  | status     |
  | 10020 | INTRO-COMPUT SCI/PROGRAM-   | COMS 1004 | 001 | Adam Cannon  | Tu Th | 1:00pm-4:10pm | BTBA RTBA | 05/26/2020 - 07/02/2020 | Restricted |
  | 10319 | INTRO-COMPUT SCI/PROGRAM-   | COMS 1004 | 002 | Paul Blaer   | Mo We | 5:30pm-8:40pm | BTBA RTBA | 07/06/2020 - 08/14/2020 | Restricted |
  | 10021 | DATA STRUCTURES IN JAVA     | COMS 3134 | 001 | Paul Blaer   | Mo We | 1:00pm-4:10pm | BTBA RTBA | 05/26/2020 - 07/02/2020 | Restricted |
  | 10025 | Natural Language Processing | COMS 4705 | 001 | Daniel Bauer | Mo We | 1:00pm-4:10pm | BTBA RTBA | 05/26/2020 - 07/02/2020 | Restricted |


  And I am on the calendar page


Scenario: find all classes

  When I press "Search"
  Then I should be on the search results page
  And 4 seed courses should exist


Scenario: look for previously taken courses

  When I press "Past classes"
  Then I should be on the past classes page


Scenario: look for the degree audit information

  When I press "Degree Audit"
  Then I should be on the degree audit page


Scenario: log out

  When I press "Log out"
  Then I should be on the home page
