require_relative 'space.rb'
require_relative 'round.rb'
require_relative 'opponent.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'play.rb'



require 'pry'


game=Play.new 
game.how_many_rounds?
game.start_playing


