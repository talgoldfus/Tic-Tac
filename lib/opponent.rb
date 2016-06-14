require 'pry'

class Opponent 
@@wining_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

attr_accessor  :mark ,:score ,:board ,:played_board
attr_reader :name

def initialize(mark)
  @mark=mark
  @score=0
  @name="Computer"
end

def turn 
  puts "Computer is choosing his next move"
  best_move

end


  def best_move
     @played_board=@board.board
     my_positions=[]
     op_positions=[]

     @played_board.each_with_index do |box,index|
         my_positions<<index if box.mark==@mark
         op_positions<<index if ((box.mark!= @mark )&& (box.mark != " "))
     end
     #Checks to see if its the computers first move if it is it chooses the middle spot unless its taken and then it generates a random number.
     
      if (my_positions.length== 0 && board.taken?(@board.board[8]) == false)
        return 9
      elsif (my_positions.length== 0 && board.taken?(@board.board[8]))
        return rand(1..9) 
      end

     #1)Iterate through the opponents plays and checks if they exsist in any of the winning combos .
      #2) Returns an array of possible combos that opponent won't interfir with 
      combo_options=  op_positions.map do |position|
        @@wining_combos.reject do |combo|
            combo.include?(position)
        end
      end.flatten(1)
      #If there is no other winning moves to play just picks a random number till game is tied.
       return rand(1..9) if combo_options.first== nil
 
      #Creates an array with possible combos that comuter already has marks in.
      preferd_combos = my_positions.map do |position|
        combo_options.select do |combo|
            combo.include?(position)
          end
      end.flatten(1)

      #Returns the best combo - the combo with the most computer marks currently on the board
      best_combo = preferd_combos.sort_by {|combo| (my_positions-combo).length }.uniq
      choose_number(best_combo,my_positions)

  end

  def choose_number(best_combo,my_positions)

    i=0
    while i<best_combo.length
  #Picks the next positions in the best combo that is currently not taken by computer
       
      if @board.taken?(@board.board[(best_combo[i]-my_positions).first]) == false
        next_move=(best_combo[i]-my_positions).first
        return next_move+= 1 
      else
        i+=1
      end
  end

      
      next_move

  end


end


