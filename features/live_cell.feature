Feature: Evolving a living cell
  In order to create a functioning rules engine  
  As a programmer of Conway's Game of Life  
  I can evolve a single living cell  

  Scenario: Living cell with 0 neighbors dies
    Given the following setup
      | . | . | . |
      | . | x | . |
      | . | . | . |
    When I evolve the board
    Then the center cell should be dead
