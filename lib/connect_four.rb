require 'connect_four/player'
require 'connect_four/cell'
require 'connect_four/board'
require 'connect_four/game'
require "connect_four/version"

module ConnectFour
  class Error < StandardError; end
end

players = [Player.new(color: '■'), Player.new(color: '□')]
game = Game.new(players: players)

game.play
