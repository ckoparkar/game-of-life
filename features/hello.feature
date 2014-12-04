Feature: Say hello

This is a sample feature, which tests if we can print out hello.

Scenario: GameOfLife hello
Given Nothing
When I run GameOfLife hello
Then I should see "hello"
