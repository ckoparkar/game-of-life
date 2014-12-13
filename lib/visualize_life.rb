require_relative 'game_of_life.rb'
require 'shoes'

class World
  WIDTH = 15

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
        cell =  @app.rect(left: WIDTH * y, top: WIDTH * x, width: WIDTH)
        cell.style(fill: '#fff')
        @board[y][x] = x
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
