require_relative 'game_of_life.rb'
require 'shoes'

class Cell

  WIDTH = 15

  def initialize(args)
    @x = args[:x]
    @y = args[:y]
    @app = args[:app]

    @shoes_cell = @app.rect(left: WIDTH * @y, top: WIDTH * @x, width: WIDTH)
    @shoes_cell.style(fill: '#fff')
  end
end

class World
  def initialize(args)
    @board = []
    @width = args[:width]
    @height = args[:height]
    @app = args[:app]
  end

  def create_board
    @height.times do |y|
      @board[y] = []
      @width.times do |x|
        @board[y][x] = Cell.new(y: y, x: x, app: @app)
      end
    end
  end

end

Shoes.app(title: 'The Game of Life', width: 800, height: 600) do
  background white

  stack(margin: 10) do |board_holder|
    @new_world = World.new(width: 40, height: 40, app: self)
    @new_world.create_board
  end
end
