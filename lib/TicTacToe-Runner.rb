require_relative 'models/space.rb'
require_relative 'models/round.rb'
require_relative 'models/opponent.rb'
require_relative 'models/player.rb'
require_relative 'models/board.rb'
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




