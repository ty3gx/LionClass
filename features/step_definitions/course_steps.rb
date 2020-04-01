require 'watir'
browser = Watir::Browser.new

Given /the following courses exist/ do |courses_table|
  courses_table.hashes.each do |course|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Course.create!(course)
  end
end

When /^I search by nothing/ do
	browser = Watir::Browser.new
	browser.goto "http://localhost:3000/calendar"
end

When /^I search by course title (.+)$/ do |title|
	browser = Watir::Browser.new
	browser.goto "http://localhost:3000/calendar"
	browser.text_field(id: "title").set(title)
end

When /^I search by course number (.+)$/ do |number|
	browser = Watir::Browser.new
	browser.goto "http://localhost:3000/calendar"
	browser.text_field(id: "title").set(number)
end

When /^I search by course call number (.+)$/ do |call_num|
	browser = Watir::Browser.new
	browser.goto "http://localhost:3000/calendar"
	browser.text_field(id: "call_num").set(call_num)	
end

When /^I search by course professor (.+)$/ do |prof|
	browser = Watir::Browser.new
	browser.goto "http://localhost:3000/calendar"
	browser.text_field(id: "prof").set(prof)
end

When /^I search by both course call number (.+) and course title (.+)$/ do | call_num, title|
	browser = Watir::Browser.new
	browser.goto "http://localhost:3000/calendar"
	browser.text_field(id: "call_num").set(call_num)
	browser.text_field(id: "title").set(title)
end	


When /^I click search$/ do
	browser.button(name: "SearchBtn").click
end

Then /^I should see (.+)$/ do |search_result|
	puts browser.text
	browser.text.include?(search_result).should == true
	browser.close
end

Then /(.*) courses should exist/ do | n_seeds |
	rows = browser.table.rows.length - 1
  	rows.should be n_seeds.to_i
  	browser.close
end

Then /^I should have all of the courses/ do
	rows = browser.table.rows.length - 1
	Course.count().should be rows
	browser.close
end

