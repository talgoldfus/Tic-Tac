require_relative 'space.rb'
require_relative 'round.rb'
require_relative 'opponent.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'services/make_move.rb'
require_relative 'services/start_playing.rb'
require_relative 'services/initiate_game.rb'
require_relative 'services/computer_ai.rb'


  class Runner

    def run
    tic_tac= Initiate_game.new
    game=tic_tac.new_game
    game.start_playing
    end

  end


  Runner.new.run




