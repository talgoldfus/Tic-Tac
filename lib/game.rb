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
    @player_mark = gets.chomp
    @player = Player.new(playername,@player_mark)
  end

  def create_opponent
     @player_mark == 'X' ? @computer = Opponent.new('O') : @computer = Opponent.new('X')
  end


  def current
    if @turn_count.even? 
       @player
    else 
      @computer
    end
  end


  def turn 
    @current_board.move(current.turn,current) 
    #@current_board.display_board
    @turn_count += 1
  end

  def end_round
    if @current_board.tie? 
      puts "This game ended in a tie! "
    else
      puts "Congratulations! #{@current_board.won?}"
    end
  end



end