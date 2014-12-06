#
# This is a Shoes app to visualize your game of life.
#

## REQUIRE YOUR OWN CLASS HERE ##
require_relative 'game_of_life.rb'
require 'shoes'
W = 20 # cell width

Shoes.app :title => 'Game of Life'do
  background khaki
  stroke black

  def initialize_cells(life)
    @height = life.size
    @width = life.first.size
    @cells = Array.new(@height){Array.new @width}
    @height.times{|j| @width.times{|i| @cells[j][i] = rect 100+W*i, 50+W*j, W, W, :fill => white}}
    @initialized = true
  end

  def show_cells
    ## INSERT YOUR OWN CLASS WITH ITS ARGUMENTS HERE ##
    grid = [['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
            ['.','.','.','x','x','x','.','.','.','x','x','x','.','.','.'],
            ['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
            ['.','x','.','.','.','.','x','.','x','.','.','.','.','x','.'],
            ['.','x','.','.','.','.','x','.','x','.','.','.','.','x','.'],
            ['.','x','.','.','.','.','x','.','x','.','.','.','.','x','.'],
            ['.','.','.','x','x','x','.','.','.','x','x','x','.','.','.'],
            ['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
            ['.','.','.','x','x','x','.','.','.','x','x','x','.','.','.'],            
            ['.','x','.','.','.','.','x','.','x','.','.','.','.','x','.'],
            ['.','x','.','.','.','.','x','.','x','.','.','.','.','x','.'],
            ['.','x','.','.','.','.','x','.','x','.','.','.','.','x','.'],
            ['.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'],
            ['.','.','.','x','x','x','.','.','.','x','x','x','.','.','.']]

    game = GameOfLife.new(grid: grid)
    @e = every 1 do |n|
      @n.text = "Generation: #{n}"
      life = game.evolve_game
      @initialized ||= initialize_cells(life)
      @height.times{|j| @width.times{|i| @cells[j][i].style :fill => (life[j][i] == '.' ? white : green)}}
    end
  end

  gb = stack
  para link('start'){gb.clear{show_cells}}
  para link('stop'){@e.stop}
  @n = para
end
