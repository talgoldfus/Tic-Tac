require 'pry'

class Opponent 
  @@wining_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor  :mark ,:score ,:board ,:played_board ,:my_positions ,:op_positions
  attr_reader :name

  def initialize(mark)
    @mark=mark
    @score=0
    @name="Computer"
  end

  def turn 
    puts "Computer is choosing his next move"
    current_positions
    best_move
  end


  def current_positions
    @played_board=@board.board
     @my_positions=[]
     @op_positions=[]

     @played_board.each_with_index do |box,index|
         @my_positions<<index if box.mark==@mark
         @op_positions<<index if ((box.mark!= @mark )&& (box.mark != " "))
  end

  end

  def best_move

     #Checks to see if its the computers first move if it is it chooses the middle spot unless its taken and then it generates a random number.
      return first_choice if first_turn?
      #1)Iterate through the opponents plays and checks if they exsist in any of the winning combos .
      #1B) Returns an array of possible combos that opponent does not block
      combo_options
      #If there is no other winning moves to play just picks a random number till game is tied.
      
      #Creates an array with possible combos that comuter already has marks in.
      prefered_combos
      #Returns the best combo - the combo with the most computer marks currently on the board
      #choose_number(best_combo,my_positions)
      (op_kill_move == false) ? next_move : op_kill_move+1
  end


  def first_turn?
      my_positions.length == 0 ? true : false
  end 

  def first_choice
    if (first_turn? && !box_taken?(4))
        return 5
    elsif ( first_turn? && box_taken?(4))
        return 9 
    end
  end

  def box_taken?(box_num)
    board.taken?(@board.board[box_num])
  end

  def combo_options   
      @@wining_combos.each_with_object([]) do |combo,arr|
        if op_positions.length == (op_positions-combo).length
         arr << combo
        end
      end    
  end

  def prefered_combos
   combo_options.each_with_object([]) do |combo,arr|
        if my_positions.length != (my_positions-combo).length
         arr << combo
        end
    end 
  end

  def best_combo
    prefered_combos.sort_by {|combo| (my_positions-combo).length }.uniq
  end


  def next_move
  return rand(1..9) if combo_options.first== nil
  (best_combo.first-my_positions).first + 1
  end

  def op_kill_move
    #Checks to see if the opponent has 2 plays on a combo if it does it blocks it
  op_options= @@wining_combos.each_with_object([]) do |combo,arr|
                if op_positions.length != (op_positions-combo).length
                 arr << combo
                end
              end  

      win= op_options.find {|combo| (board.taken?(@board.board[(combo-op_positions).first])==false) && ((combo-op_positions).length == 1 )}
   

      win != nil ? (win-op_positions).first : false
  end
end

