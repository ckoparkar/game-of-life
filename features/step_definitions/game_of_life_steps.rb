Given(/^Nothing$/) do
end

When(/^I run GameOfLife hello$/) do
  @hello = GameOfLife.hello
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(@hello).to eq "hello"
end

Given(/^the following setup$/) do |table|
  @data = table.raw
  @game = GameOfLife.new(data: @data)
end

When(/^I evolve the board$/) do
  @game.evolve_game
end

Then(/^the center cell should be dead$/) do
  expect(@game.is_dead?(@data.size/2, @data[0].size/2)).to be true
end

Then(/^the center cell should be alive$/) do
  expect(@game.is_alive?(@data.size/2, @data[0].size/2)).to be true
end
