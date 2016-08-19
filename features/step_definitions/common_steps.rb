Then /^I should see '(.*)'$/ do |text|
  page.should have_content(text)
end

When /^I press '(.*)'$/ do |name|
  click_on name
end

Given /^I fill in '(.*)' for '(.*)'$/ do |value, field|
  fill_in field, :with => value
end

Given /^I select '(.*)' for '(.*)'$/ do |option, field|
  select option, :from => field
end
