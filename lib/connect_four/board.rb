require 'matrix'

module ConnectFour
  class Board
    attr_reader :grid
    def initialize(grid: default_grid)
      @grid = grid
    end

    def four_connected?(line)
      line.each_cons(4).any? do |four_cons|
        four_cons.include?(" ") ? next : four_cons.uniq.size == 1
      end
    end

    def lines
      grid.concat(grid.transpose).concat(diagonals)
    end

    private

    def default_grid
      Array.new(6) { Array.new(7) { Cell.new } }
      # Matrix.build(6, 7) { Cell.new }
    end

    def sawt_diagonal(row: 0, col: 0)
      max_row = grid.size
      max_col = grid[0].size
      diagonal = []

      while row < max_row && col < max_col
        diagonal << grid[row][col]
        row += 1
        col += 1
      end

      diagonal
    end

    def ramp_diagonal(row: 0, col: 0)
      max_row = grid.size
      diagonal = []

      while col >= 0 && row < max_row
        diagonal << grid[row][col]
        row += 1
        col -= 1
      end

      diagonal
    end

    def diagonals
      result = []

      0.upto(3) do |n|
        result << sawt_diagonal(col: n)
        result << ramp_diagonal(col: n + 3)
      end

      1.upto(2) do |n|
        result << sawt_diagonal(row: n)
        result << ramp_diagonal(row: n, col: 6)
      end

      result
    end
  end
end
