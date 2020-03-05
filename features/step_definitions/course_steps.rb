# Add a declarative step here for populating the DB with movies.

Given /the following courses exist/ do |courses_table|
  courses_table.hashes.each do |course|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Course.create!(course)
  end
end

Then /(.*) seed courses should exist/ do | n_seeds |
  Course.count.should be n_seeds.to_i
end
