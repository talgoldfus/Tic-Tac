class Play

attr_accessor :rounds , :game_player ,:game_opponent ,:final_score ,:round

def initialize
  @round=Round.new
  @game_player=@round.create_player
  @game_opponent=@round.create_opponent
  @rounds=0
end

def how_many_rounds?
  puts "Until what score do you want to play?"
  @final_score=gets.chomp.to_i 
end

def start_round
  
  while ( @round.current_board.won? == false ) && (@round.current_board.tie? == false)
    @round.turn
    @round.current_board.display_board
  end
  @round.round_end
  if @round.current_board.won? != false
    @round.declare_winner.score += 1
  end
  @rounds += 1
end

def start_playing

    while (@game_opponent.score != @final_score) && ( @game_player.score != @final_score)
      @round.current_board.new_round
      start_round
    end

    if @game_opponent.score == @final_score 
      puts "Sorry! #{@game_player.name} the Computer won the game in #{@rounds} rounds"
    else
      puts"Congrats #{@game_player.name} you won the game in #{@rounds} rounds"
    end

end

end