require "Pry"

##########################
#CLASS DECLARATION
##########################

class Position

  def initialize (char, num)
    @chars = ["A", "B", "C", "D", "E", "F", "G", "H"]
    @xCoordinate = @chars.index(char) + 1
    @yCoordinate = num
  end

  def numeric
    return [@xCoordinate, @yCoordinate]
  end

end

class Piece 

  def initialize
    @board = Board.new.board
    @possible_positions = []
  end
  
  def validate_position(init, final)
    possible_positions(init)
    @possible_positions.include?(final)? puts("legal") : puts("ilegal")
  end
  
end

class Rook < Piece

  def possible_positions(ini_position)
    @board.each do |positions| 
      if positions[0] == ini_position[0] || positions[1] == ini_position[1]
        @possible_positions << positions
      end    	
    end
    @possible_positions.delete(ini_position)
  end

end

class Bishop < Piece

  def possible_positions(ini_position)
    @board.each do |positions| 
      if positions[0]-ini_position[0] == positions[1]-ini_position[1]
        @possible_positions << positions
      end    	
    end
    @possible_positions.delete(ini_position)
  end

end

class Board

  def initialize
    @board = []
    @x_limit = [1,2,3,4,5,6,7,8]
    @y_limit = [1,2,3,4,5,6,7,8]
  end	

  def board
    @x_limit.each do |x|
      @y_limit.each do |y|
      	@board.push << [x, y]
      end
    end
    return @board 	
  end	

end

##########################
#MAIN
##########################

Rook.new.validate_position(Position.new("C",2).numeric, Position.new("C",8).numeric)
Bishop.new.validate_position(Position.new("C",2).numeric, Position.new("D",3).numeric)

