Given(/^I have maps titled (.+)$/) do |headers|
  headers.split(',').each do |header|
    puts header
  end
end

When(/^I go to the list of maps$/) do
  pending
end

Then(/^I should see header "([^"]*)"$/) do |header|
  puts header
end