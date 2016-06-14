
require 'pry'
class Board

     
      @@wining_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


    def initialize
        @board = []
        9.times {|num| @board[num]=Space.new}
    end

    #Display the current board given the board instant variable

    def display_board

      puts " #{@board[0].mark} | #{@board[1].mark} | #{@board[2].mark} "
      puts "-----------"
      puts " #{@board[3].mark} | #{@board[4].mark} | #{@board[5].mark} "
      puts "-----------"
      puts " #{@board[6].mark} | #{@board[7].mark} | #{@board[8].mark} "
    end

    #Checks to see if a specific box in the board is taken

    def taken?(box)
      box.mark != " " ? true : false
    end


    #Checks to see if the board is full

    def full?
      answer= @board.each {|box| return false if taken?(box) == false }
        unless answer ==false 
        true
        end
      end

    #Checks to see if the the game has been won . If so returns the winning mark . If not returns false

    def won?

      #Makes 2 arrays one for X and one for O and writes down the index numbers of the boxes they occupy within the board
      xpos=[]
      opos=[]
      @board.each_with_index do |box,index|
             xpos<<index if box.mark=="X"
             opos<<index if box.mark=="O"
      end
      test=@@wining_combos.detect {|combo| (combo-xpos).empty? || (combo-opos).empty? } 

      #Iterates throu the winig combos array and checks if any wining combo is included within the xpos or opos arrays . If so returns the wiinning mark if not returns nill
       test != nil ? @board[test.first].mark : false
       #If above statements is nil meaning no one won the game yet the won? mehtod will return false
     end

      #checks to see if the game is at a tie . 
    def tie?
     full? && (won? == false) 
    end

    def move(box_num,player)
      if taken?(@board[box_num.to_i-1]) 
        puts "This box is taken, please choose another box." 
        new_choice = player.turn
        binding.pry
        move(new_choice,player)
      else    
        @board[box_num.to_i-1].mark = player.mark
      end
    end

    def new_round
      9.times {|num| @board[num]=Space.new}
    end
end





