Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end


When /^(?:|I )press "([^"]*)"$/ do |link|
  click_link(link)
end


Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end