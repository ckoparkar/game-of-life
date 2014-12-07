require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end
require_relative '../lib/game_of_life.rb'
