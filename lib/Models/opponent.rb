require 'pry'

class Opponent 
  
  attr_accessor  :mark ,:score 
  attr_reader :name

  def initialize(mark)
    @mark=mark
    @score=0
    @name="Computer"
  end

end