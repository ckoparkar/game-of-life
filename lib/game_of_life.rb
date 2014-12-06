require 'pry'

class GameOfLife

  attr_reader :grid

  def initialize(args)
    @grid = args[:grid]
  end

  def evolve_game
    grid = []
    for x in (0...@grid.size).to_a do
      t = []
      for y in (0...@grid[0].size).to_a do
        case
        when is_dead?(x, y)
          t << evolve_dead(x, y)
        else
          t << evolve_live(x, y)
        end
      end
      grid << t
    end
    @grid = grid
  end

  def evolve_dead(x, y)
    live_neighbors(neighbors(x, y)) == 3 ? 'x' : '.'
  end

  def evolve_live(x, y)
    case live_neighbors(neighbors(x, y))
    when 0...2
      return '.'
    when 2,3
      return 'x'
    when 4..(10/0.0)
      return '.'
    end
  end

  def is_dead?(x, y)
    @grid[x][y] == '.'
  end

  def is_alive?(x, y)
    @grid[x][y] == 'x'
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
    x1, x2 = get_range(x, @grid.size)
    y1, y2 = get_range(y, @grid[0].size)
    for r in (x1..x2).to_a do
      for c in (y1..y2).to_a do
        n << @grid[r][c]
      end
    end
    n.delete_at n.index(@grid[x][y])
    n
  end

end

# grid = [['.', '.', '.','.', '.'],
#         ['.', '.', '.','.', '.'],
#         ['.', 'x', 'x','x', '.'],
#         ['.', '.', '.','.', '.'],
#         ['.', '.', '.','.', '.']]

# game = GameOfLife.new(grid: grid)
# p game.evolve_game
# binding.pry
