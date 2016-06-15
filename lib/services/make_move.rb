require 'pry'
class Make_move

attr_accessor :round ,:board

def initialize(round,board)
  @round=round
  @board=board
end

def move(box_num,player)
    chosen_box=board.board[box_num.to_i-1]

      if board.taken?(chosen_box) 
        puts "This box is taken, please choose another box." 
        new_turn
      else    
        round.turn_count += 1 
        chosen_box.mark = player.mark
      end
      
end


def new_turn
    if round.currently_playing == round.computer
      move(computer_move,round.computer)
    else
      move(player_move,round.player)
    end
end


def computer_move 
    computer= Computer_ai.new(round.currently_playing.mark,board)
    puts "Computer is choosing his next move"
    computer.best_move
end

def player_move 
  puts "Where would you like to move? Choose box 1 - 9:"
  choice = gets.chomp
end

end