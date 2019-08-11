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

    def to_s
      draw = "- - - - - - - -\n"
      rows.each do |row|
        draw += "-#{row.join(' ')}-\n"
      end
      draw
    end

    def set_cell(value, index)
      col = grid.transpose[index - 1] # Deal with Cell objs, not mappings of their values
      ind = col.reverse_each.find_index(&:empty?)

      index_of_last_empty_cell = -(ind + 1) # reverse_each starts again from 0, transpose it

      col[index_of_last_empty_cell].value = value
    end

    def game_over?
      lines.any? { |line| four_connected?(line) }
    end

    private

    def rows
      grid.map { |row| row.map(&:value) }
    end

    def columns
      rows.transpose
    end

    def default_grid
      Array.new(6) { Array.new(7) { Cell.new } }
    end

    def sawt_diagonal(row: 0, col: 0)
      max_row = rows.size
      max_col = columns.size
      diagonal = []

      while row < max_row && col < max_col
        diagonal << rows[row][col]
        row += 1
        col += 1
      end

      diagonal
    end

    def ramp_diagonal(row: 0, col: 0)
      max_row = rows.size
      diagonal = []

      while col >= 0 && row < max_row
        diagonal << rows[row][col]
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

    def lines
      [].concat(rows).concat(columns).concat(diagonals)
    end
  end
end
