require 'watir'

browser = Watir::Browser.new
browser.goto "http://localhost:3000/"

When /^I go to the register page$/ do
	browser = Watir::Browser.new
	browser.goto "http://localhost:3000/register"
end

When /^I go to the login page$/ do
	browser = Watir::Browser.new
	browser.goto "http://localhost:3000/"
end

When /^I enter blank details for Register$/ do
	browser.text_field(id: "name").set("")
end

When /^I put username as(.+)$/ do |user_name|
	browser.text_field(id: "name").set(user_name)
end

When /^I put email as(.+)$/ do |user_email|
	browser.text_field(id: "email").set(user_email)
end

When /^I put password as (.+)$/ do |user_password|
	browser.text_field(id: "password").set(user_password)
end

When /^I put password-confirm as (.+)$/ do |user_password|
	browser.text_field(id: "password_confirm").set(user_password)
end

When /^I click register$/ do
	browser.button(name: "Register").click
end

When /^I click login$/ do
	browser.button(name: "Login").click
end

Then /^the register should be successful$/ do
	puts " Sucessfully registered"
	browser.close
end

Then /^the login should be successful$/ do
	puts " Sucessfully logged in"
	browser.close
end

Then /^the login should fail$/ do
	puts "Login failed"
	browser.close
end

Then /^the register should fail$/ do
	puts "Register failed"
	browser.close
end
