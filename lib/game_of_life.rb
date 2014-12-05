require 'pry'

class GameOfLife
  def self.hello
    "hello"
  end

  def initialize(args)
    @data = args[:data]
  end

  def evolve_game
    data = []
    for x in (0...@data.size).to_a do
      t = []
      for y in (0...@data[0].size).to_a do
        case
        when is_dead?(x, y)
          t << evolve_dead(x, y)
        else
          t << @data[x][y]
        end
      end
      data << t
    end
    @data = data
  end

  def evolve_dead(x, y)
    live_neighbors(neighbors(x, y)) == 3 ? 'x' : '.'
  end

  def is_dead?(x, y)
    @data[x][y] == '.'
  end

  def is_alive?(x, y)
    @data[x][y] == 'x'
  end

  private

  def get_range(n, limit)
    n1 = [n - 1, 0].max
    n2 = [n + 1, limit - 1].min
    [n1, n2]
  end

  def dead_neighbors(ns)
  end

  def live_neighbors(ns)
    ns.count('x')
  end

  def neighbors(x, y)
    n = []
    x1, x2 = get_range(x, @data.size)
    y1, y2 = get_range(y, @data[0].size)
    for r in (x1..x2).to_a do
      for c in (y1..y2).to_a do
        n << @data[r][c]
      end
    end
    n.delete_at n.index(@data[x][y])
    n
  end

end

# data = [['.', '.', '.'],
#         ['.', '.', '.'],
#         ['.', '.', '.']]

# game = GameOfLife.new(data: data)
# p game.evolve_game
# binding.pry
