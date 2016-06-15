class Round
  attr_accessor :player, :computer, :player_mark ,:current_board ,:turn_count
  
  def initialize(player,computer,board)
    @current_board = board 
    @player=player
    @computer=computer
    @turn_count = 0 
  end

  def currently_playing 
    if @turn_count.even?
     @computer 
    else 
     @player
    end
  end


  def declare_winner
    if current_board.won? == @player.mark
    @player
    else
     @computer
    end
  end

  def round_end
    if current_board.tie? 
      puts "This round ended in a tie! "
    else
      puts "Congratulations! #{declare_winner.name} won this round"
    end
  end



end