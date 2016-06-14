class Player 

attr_accessor :name , :mark ,:score ,:board

def initialize(name,mark)
  @name=name
  @mark=mark
  @score=0
end

def turn 
  puts "Where would you like to move? Choose box 1 - 9:"
  choice = gets.chomp
end







end