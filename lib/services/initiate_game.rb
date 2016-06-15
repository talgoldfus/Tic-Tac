class Initiate_game

  attr_accessor  :game_player ,:game_opponent ,:final_score ,:round ,:player_mark ,:board

  def initialize
    puts "Welcome to tic-tac-toe!"
    @board =Board.new
    @game_player=create_player
    @game_opponent=create_opponent
    @round=Round.new(game_player,game_opponent,board)
    how_many_rounds?
  end

  def create_player
      puts "What is your name?"
      playername = gets.chomp
      choose_marker
      player = Player.new(playername,@player_mark)
  end

  def create_opponent
       @player_mark == 'X' ? @computer = Opponent.new('O') : @computer = Opponent.new('X')
  end

  def choose_marker
  puts "Choose a marker X or O?"
      @player_mark = gets.chomp.capitalize
  choose_marker if player_mark != "X" && player_mark != "O" 
  end

  def how_many_rounds?
    puts "Till what score do you want to play?"
    @final_score=gets.chomp.to_i 
  end

  def new_game
     game = Start_Playing.new(board,game_player,game_opponent,round,final_score)
  end

end