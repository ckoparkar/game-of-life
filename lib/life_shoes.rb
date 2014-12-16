require_relative 'game_of_life.rb'
require 'shoes'
W = 15 # cell width
HEIGHT = 40
WIDTH = 40

$grid = []
HEIGHT.times do
  $grid << Array.new(WIDTH, '.')
end

Shoes.app title: 'Game of Life', width: WIDTH * 16.5, height: HEIGHT * 17.5 do
  stroke black

  def draw_grid
    @buttons = []
    HEIGHT.times do |y|
      @buttons[y] = []
      WIDTH.times do |x|
        @buttons[y][x] = rect(top: 70 + W * y, left: 20 + W * x, width: W, fill: white)
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
        @cells[j][i] = rect(top: 70 + W * j, left: 20 + W * i, width: W, fill: white)
      end
    end
    @initialized = true
  end

  def show_cells
    game = GameOfLife.new(grid: $grid)
    @e = every 1/20.0 do |n|
     @n.text = "Generation: #{n}"
      life = game.evolve_game
      @initialized ||= initialize_cells(life)
      HEIGHT.times do |j|
        WIDTH.times do |i|
          @cells[j][i].style(fill: life[j][i] == '.' ? white : green)
        end
      end
    end
  end

  gb = stack
  @n = para(top: 40, left: 5)
  @start = link('start', stroke: green){ gb.clear{show_cells} }
  @stop = link('stop', stroke: red){ @e.stop }
  @reset = link('reset', stroke: black){
    @e.stop
    gb.clear{ draw_grid }
    @n.text = ''
  }
  gb.clear{ draw_grid }
  para(@start, top: 10, left: 5)
  para(@stop, top: 10, left: 50)
  para(@reset, top: 10, left: 95)
end
