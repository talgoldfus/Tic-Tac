class Round
  attr_accessor :player, :computer, :player_mark ,:current_board ,:turn_count
  
  def initialize
    puts "Welcome to tic-tac-toe!"
    @current_board = Board.new
    @turn_count = 0 
  end

  def create_player
    puts "What is your name?"
    playername = gets.chomp
    puts "X or O?"
    @player_mark = gets.chomp.capitalize
    @player = Player.new(playername,@player_mark)
  end

  def create_opponent
     @player_mark == 'X' ? @computer = Opponent.new('O') : @computer = Opponent.new('X')
  end


  def current
    if @turn_count.even?
     @computer 
       
    else 
     @player
    end
  end


  def turn 
    current.board=@current_board
    @current_board.move(current.turn,current) 
    #@current_board.display_board
    @turn_count += 1
  end

  def declare_winner
    if @current_board.won? == @player.mark
      @player
    else
     @computer
    end
  end

  def round_end
    if @current_board.tie? 
      puts "This round ended in a tie! "
    else
      puts "Congratulations! #{declare_winner.name} won this round"
    end
  end



end