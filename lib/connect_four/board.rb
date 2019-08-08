module ConnectFour
  class Board
    attr_reader :grid
    def initialize(grid: default_grid)
      @grid = grid
    end

    private

    FOUR_BLACKS = Array.new(4) { Cell.new value: '■' }
    FOUR_WHITES = Array.new(4) { Cell.new value: '□' }

    def default_grid
      Array.new(6) { Array.new(7) { Cell.new } }
    end
  end
end
