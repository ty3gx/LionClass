Feature: take in user log in information and route to class search page
 
  As a Columbia student
  So that I can enroll in classes that I need
  I want to find out all class information and reviews


Background: classes have been added to database

  Given the following courses exist:
  | call  | title                       | number    | sec | instructor   | day   | time          | location  | period                  | status     |
  | 10020 | INTRO-COMPUT SCI/PROGRAM-   | COMS 1004 | 001 | Adam Cannon  | Tu Th | 1:00pm-4:10pm | BTBA RTBA | 05/26/2020 - 07/02/2020 | Restricted |
  | 10319 | INTRO-COMPUT SCI/PROGRAM-   | COMS 1004 | 002 | Paul Blaer   | Mo We | 5:30pm-8:40pm | BTBA RTBA | 07/06/2020 - 08/14/2020 | Restricted |
  | 10021 | DATA STRUCTURES IN JAVA     | COMS 3134 | 001 | Paul Blaer   | Mo We | 5:30pm-8:40pm | BTBA RTBA | 05/26/2020 - 07/02/2020 | Restricted |
  | 10025 | Natural Language Processing | COMS 4705 | 001 | Daniel Bauer | Mo We | 5:30pm-8:40pm | BTBA RTBA | 05/26/2020 - 07/02/2020 | Restricted |
  | 12624 | INTRODUCTION TO DATABASES   | COMS 4111 | 001 | Kenneth A Ross | Mo We | 1:10pm-2:25pm | 501 Northwest Corner Building | NA | NA |  
  | 16219 | ADVANCED SOFTWARE ENGINEE | COMS 4156 | 001 | Junfeng Yang | Tu | 12:10pm-2:00pm | 411 International Affairs Building | NA | NA |
  | 12630 | SECURITY II | COMS 4182 | 001 | Steven M Bellovin | Fri | 10:10am-12:40pm | 545 Seeley W. Mudd Building | NA | NA |
  | 12632 | Natural Language Processing | COMS 4705 | 001 | Yassine Benajiba | Fri | 1:10pm-3:40pm | 402 Chandler | NA | NA |


Scenario: find all classes

  When I search by nothing
  And I click search
  Then I should have all of the courses


Scenario: find all NLP classes by Course Number

  When I search by course number 4705
  And I click search
  Then 2 courses should exist


Scenario: find all database classes by Course Name

  When I search by course title Database
  And I click search
  Then I should see COMS 4111 sec: 1 INTRODUCTION TO DATABASES


Scenario: find the class by Call Number
  When I search by course call number 10020
  And I click search
  Then I should see COMS 1004 sec: 1 INTRO-COMPUT SCI/PROGRAM-


Scenario: no classes found
  When I search by both course call number 10020 and course title Database
  And I click search
  Then I should see No result


Scenario: look for previously taken courses

  When I am on the calendar page
  And I press "Past classes"
  Then I should be on the past classes page


Scenario: look for the degree audit information

  When I am on the calendar page
  And I press "Degree Audit"
  Then I should be on the degree audit page


Scenario: go back to the user course page

  When I am on the search results page
  And I press "Go Back"
  Then I should be on the calendar page


Scenario: log out

  When I am on the calendar page
  And I press "Log out"
  Then I should be on the login page

