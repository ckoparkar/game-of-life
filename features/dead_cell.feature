Feature: Evolving a dead cell
  In order to create a functioning rules engine  
  As a programmer of Conway's Game of Life  
  I can evolve a single dead cell based

Scenario: Dead cell with 0 neighbors stays dead
    Given the following setup
      | . | . | . |
      | . | . | . |
      | . | . | . |
    When I evolve the board
    Then the center cell should be dead
