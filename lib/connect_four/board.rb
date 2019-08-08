require 'pry'

module ConnectFour
  class Board
    attr_reader :grid
    def initialize(grid: default_grid)
      @grid = grid
    end

    def four_connected?(line)
      line.each_cons(4).any? do |cons|
        next if cons.include? " "

        cons.uniq.size == 1
      end
    end

    private

    def default_grid
      Array.new(6) { Array.new(7) { Cell.new } }
    end
  end
end
