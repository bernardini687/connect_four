require 'pry'

module ConnectFour
  class Board
    attr_reader :grid
    def initialize(grid: default_grid)
      @grid = grid
    end

    def four_connected?(line)
      # line.map(&:value)...
      line.each_cons(4).any? do |four_cons|
        four_cons.include?(" ") ? next : four_cons.uniq.size == 1
      end
    end

    def set_cell(value, column)
      col = grid.transpose[column - 1]
      index_of_empty_cell = col.reverse_each.find_index(&:empty?)
      col[col.size - 1 - index_of_empty_cell].value = value
    end

    def game_over?
      lines.any? { |line| four_connected?(line) }
      binding.pry
    end

    def lines
      [].concat(grid).concat(grid.transpose).concat(diagonals)
    end

    private

    def rows
      grid.map(&:value)
    end

    def columns
      rows.transpose
    end

    def default_grid
      Array.new(6) { Array.new(7) { Cell.new } }
      # Matrix.build(6, 7) { Cell.new }
    end

    def sawt_diagonal(row: 0, col: 0)
      max_row = rows.size
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
