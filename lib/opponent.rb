class Opponent 

attr_accessor  :mark ,:score
attr_reader :name

def initialize(mark)
  @mark=mark
  @score=0
  @name="Computer"
end

def turn 
  puts "Computer is choosing his next move"
  choice = rand(1..9)
end

end