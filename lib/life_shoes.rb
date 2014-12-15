require_relative 'game_of_life.rb'
require 'shoes'
W = 15 # cell width
HEIGHT = 40
WIDTH = 40

$grid = []
HEIGHT.times do
  $grid << Array.new(WIDTH, '.')
end

Shoes.app title: 'Game of Life', width: 800, height: 800 do
  stroke black

  def draw_grid
    @buttons = []
    HEIGHT.times do |y|
      @buttons[y] = []
      WIDTH.times do |x|
        @buttons[y][x] = rect(top: 100 + W * y, left: 50 + W * x, width: W, fill: white)
        @buttons[y][x].click{toggle_state(y,x)}
      end
    end
  end

  def toggle_state(y, x)
    $grid[y][x] = $grid[y][x] == 'x' ? '.' : 'x'
    @buttons[y][x].style(fill: $grid[y][x] == 'x' ? green : white)
  end

  def initialize_cells(life)
    @cells = Array.new(HEIGHT){Array.new WIDTH}
    HEIGHT.times do |j|
      WIDTH.times do |i|
        @cells[j][i] = rect(top: 100 + W * j, left: 50 + W * i, width: W, fill: white)
      end
    end
    @initialized = true
  end

  def show_cells
    game = GameOfLife.new(grid: $grid)
    @e = every 1 do |n|
      @n.text = "Generation: #{n}"
      life = game.evolve_game
      @initialized ||= initialize_cells(life)
      HEIGHT.times do |j|
        WIDTH.times do |i|
          @cells[j][i].style :fill => (life[j][i] == '.' ? white : green)
        end
      end
    end
  end

  gb = stack
  @n = para
  gb.clear{ draw_grid }
  para link('start'){ gb.clear{show_cells} }
  para link('stop'){ @e.stop }
  para link('reset'){
    @e.stop
    gb.clear{ draw_grid }
    @n.text = ''
  }
end
