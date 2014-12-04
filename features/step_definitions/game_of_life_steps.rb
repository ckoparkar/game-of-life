Given(/^Nothing$/) do
end

When(/^I run GameOfLife hello$/) do
  @hello = GameOfLife.hello
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(@hello).to eq "hello"
end
