require_relative './lib/connect_four/player'
require_relative './lib/connect_four/cell'
require_relative './lib/connect_four/board'
require_relative './lib/connect_four/game'

module ConnectFour
  players = [Player.new(color: '■'), Player.new(color: '□')]
  game = Game.new(players: players)

  game.play
  print `clear`
  puts "- #{game.other_player.color_name} wins! -"
  puts game.board
end
