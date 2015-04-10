require "Pry"

##########################
#CLASS DECLARATION
##########################

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
    @possible_positions = []
  end

  def validate_position(init, final)
    possible_positions(init)
    @possible_positions.include?(final)? puts("legal") : puts("ilegal")
  end
    
end

class ChessMovement < Piece
  
  
  
  def initialize
  	@board = Board.new.board
    @possible_positions = []
    @scope = Math.sqrt(@board.length).to_i
  end
  
  def possible_horizontal_positions(ini_position)
    @board.each do |positions|
     if positions[1] == ini_position[1] && (positions[0]-ini_position[0]).abs <= @scope
      	@possible_positions << positions
      end    	
    end
    @possible_positions.delete(ini_position)
  end
  
  def possible_vertical_positions(ini_position)
    @board.each do |positions|
     if positions[0] == ini_position[0]	&& (positions[1]-ini_position[1]).abs <= @scope
      	@possible_positions << positions
     end    	
    end
    @possible_positions.delete(ini_position)
  end

  def possible_diagonal_positions(ini_position)
    @board.each do |positions| 
      if positions[0]-ini_position[0] == positions[1]-ini_position[1] && (positions[0]-ini_position[0]).abs <= @scope
        @possible_positions << positions
      end    	
    end
    @possible_positions.delete(ini_position)
  end

  def possible_horse_positions(ini_position)
    @board.each do |positions| 
      if (positions[0]-ini_position[0] + positions[1]-ini_position[1]) == 3
        @possible_positions << positions
      end    	
    end
    @possible_positions.delete(ini_position)
  end

  def possible_vertical_positions(ini_position)
    @board.each do |positions|
     if positions[0] == ini_position[0]	&& (positions[1]-ini_position[1]).abs <= @scope
      	@possible_positions << positions
     end    	
    end
    @possible_positions.delete(ini_position)
  end

  def possible_pawn_positions(ini_position)
    @board.each do |positions|
      if positions[0] == ini_position[0] && (positions[1]-ini_position[1]).abs <= @scope
      	@possible_positions << positions
      end    	
    end
    if @color == "white"  
      @possible_positions.delete(ini_position[0], ini_position[1] )
    end
  end







end

class Rook < ChessMovement
  
  def possible_positions(ini_position)
    possible_horizontal_positions(ini_position)
    possible_vertical_positions(ini_position)
  end

end

class Bishop < ChessMovement

  def possible_positions(ini_position)
    possible_diagonal_positions(ini_position)
  end

end

class King < ChessMovement

  def initialize
    @possible_positions = []
    @scope = 1
  end

  def possible_positions(ini_position)
    possible_horizontal_positions(ini_position)
    possible_vertical_positions(ini_position)
    possible_diagonal_positions(ini_position)
  end

end

class Queen < ChessMovement

  def possible_positions(ini_position)
    possible_horizontal_positions(ini_position)
    possible_vertical_positions(ini_position)
    possible_diagonal_positions(ini_position)
  end

end  

class Horse < ChessMovement

  def possible_positions(ini_position)
    possible_horse_positions(ini_position)
  end

end

class Pawn < ChessMovement

  def initialize(color)
    @possible_positions = []
    @scope = 1
    @color = color
  end

  def possible_positions(ini_position)
    possible_vertical_positions(ini_position)
    if color = "w" 
      @possible_positions.delete(ini_position)
    end
   if ini_position[]

  end

end

##########################
#MAIN
##########################

Rook.new.validate_position(Position.new("C",2).numeric, Position.new("A",2).numeric)
Bishop.new.validate_position(Position.new("C",2).numeric, Position.new("D",3).numeric)
Horse.new.validate_position(Position.new("C",2).numeric, Position.new("D",4).numeric)
King.new.validate_position(Position.new("A",1).numeric, Position.new("A",3).numeric)
Queen.new.validate_position(Position.new("C",3).numeric, Position.new("A",1).numeric)
