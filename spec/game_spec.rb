# Game.drop_piece -> gets -> board.set_cell(current_player.color, gets - 1)
# switch_players
#
# play -> drop_piece until game_over?

module ConnectFour
  RSpec.describe Game do

    describe '#swith_players' do
      it 'will switch the players' do
        players = [:foo, :bar]
        game = Game.new(players: players)
        other = game.other_player
        game.switch_players

        expect(game.current_player).to eq(other)
      end
    end
  end
end
