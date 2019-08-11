# switch_players
#
# play -> drop_piece until game_over?

module ConnectFour
  RSpec.describe Game do

    describe '#switch_players' do
      it 'switches the players' do
        players = [:foo, :bar]
        game = Game.new(players: players)
        other = game.other_player
        game.switch_players

        expect(game.current_player).to eq(other)
      end
    end
  end
end
