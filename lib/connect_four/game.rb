module ConnectFour
  class Game
    attr_reader :players, :board, :current_player, :other_player
    def initialize(players:, board: Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def play
      until board.game_over?
        print `clear`
        puts "- #{current_player.color_name} moves -"
        puts "-1 2 3 4 5 6 7-"
        drop_piece
        switch_players
      end
    end

    def drop_piece
      column = ''
      until ('1'..'7').cover?(column)
        column = gets.chomp
      end

      board.set_cell(current_player.color, column.to_i)
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end
  end
end
