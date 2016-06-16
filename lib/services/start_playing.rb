class Start_Playing

attr_accessor :rounds , :game_player ,:game_opponent ,:final_score ,:round,:board

def initialize(board,game_player,game_opponent,round,final_score)
  @board =board
  @game_player=game_player
  @game_opponent=game_opponent
  @round=round
  @rounds=rounds
  @final_score = final_score
  @rounds =0
end


def start_round
  
  while ( board.won? == false ) && (board.tie? == false )
    Make_move.new(round,board).new_turn
    board.display_board
  end
  round.round_end
  if board.won? != false
    round.declare_winner.score += 1
  end
  @rounds += 1
end


def new_round
      9.times {|num| board.board[num]=Space.new}
end

def start_playing

    while (@game_opponent.score != @final_score) && ( @game_player.score != @final_score)
      new_round
      start_round
    end

    if @game_opponent.score == @final_score 
      puts "Sorry! #{@game_player.name} the Computer won the game in #{@rounds} rounds"
    else
      puts"Congrats #{@game_player.name} you won the game in #{@rounds} rounds"
    end

end

end