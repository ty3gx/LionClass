LionClass

== Currently Implemented and Tested Features ==
*Cucumber Feature Tests: if the chromedrive is not already installed*
*Please install it first by: brew cask install chromedriver*

Login Page
	- Take in user log in information
	- Check if the user exists in the system
		- If yes, authenticate the password
		- If no, the user needs to register first
	- Redirect to the class calendar page when user is authenticated and successfully logged in
	- Redirect to the register page when user presses "resgister"


Register Page
	- Take in user information and save the information to the system
	- Embedded with user input authentication
		- Blank fields are not allowed
	- Redirect to the class calendar page if registration is successful


Class Calendar Page
	- Display the calendar page 
	- Display a sample version of how the calendar would look like
	- Enable users to search for available courses for enrollment
		- Provide three search options: 
			by course Call Number
			by course Title/Number
			by course Professor
		- Allow partial searches, case insensitive
	- All class option: redirect to All Courses page
	- Past class option: redirect to Past Courses page
	- Degree Audit option: redirect to Degree Audit page
	- Log out option: log out the user and redirect to the login page


Search Courses page
	- Display the courses resulted from the search actions
	- Call number link, if clicked, redirect to the course info page
	- Go back link helps the user to navigate back to the calendar page


All Courses page
	- Display all courses currently entered in the databse
	- Call number link, if clicked, redirect to the course info page
	- Go back link helps the user to navigate back to the calendar page


Course Info page
	- Display the detailed information about the course
	- Display the reviews of the professors teaching the course
	- Provide a link to CULPA, a Columbia course evaluation forum for more reviews


Past Courses page
	- Display a sample version of all previous courses taken by the user


Degree Audit page
	- Display a sample version of the information on the degree audit page