#!/usr/bin/ruby

class Game
  attr_accessor :chess_pieces
  
  def initialize
    @board = Board.new
    @white_pawn1 = Pawn.new([1,2], "white")
    @white_pawn2 = Pawn.new([2,2], "white")
    @white_pawn3 = Pawn.new([3,2], "white")
    @white_pawn4 = Pawn.new([4,2], "white")
    @white_pawn5 = Pawn.new([5,2], "white")
    @white_pawn6 = Pawn.new([6,2], "white")
    @white_pawn7 = Pawn.new([7,2], "white")
    @white_pawn8 = Pawn.new([8,2], "white")
    @white_rook1 = Rook.new([1,1], "white")
    @white_rook2 = Rook.new([8,1], "white")
    @white_knight1 = Knight.new([2,1], "white")
    @white_knight2 = Knight.new([7,1], "white")
    @white_bishop1 = Bishop.new([3,1], "white")
    @white_bishop2 = Bishop.new([6,1], "white")
    @white_king = King.new([4,1], "white")
    @white_queen = Queen.new([5,1], "white")
    @black_pawn1 = Pawn.new([1,7], "black")
    @black_pawn2 = Pawn.new([2,7], "black")
    @black_pawn3 = Pawn.new([3,7], "black")
    @black_pawn4 = Pawn.new([4,7], "black")
    @black_pawn5 = Pawn.new([5,7], "black")
    @black_pawn6 = Pawn.new([6,7], "black")
    @black_pawn7 = Pawn.new([7,7], "black")
    @black_pawn8 = Pawn.new([8,7], "black")
    @black_rook1 = Rook.new([1,8], "black")
    @black_rook2 = Rook.new([8,8], "black")
    @black_knight1 = Knight.new([2,8], "black")
    @black_knight2 = Knight.new([7,8], "black")
    @black_bishop1 = Bishop.new([3,8], "black")
    @black_bishop2 = Bishop.new([6,8], "black")
    @black_queen = Queen.new([4,8], "black")
    @black_king = King.new([5,8], "black")
    @chess_pieces = [@white_pawn1, @white_pawn2, @white_pawn3, 
                    @white_pawn4, @white_pawn5, @white_pawn6, 
                    @white_pawn7, @white_pawn8, @white_bishop1,
                    @white_bishop2, @white_king, @white_knight1,
                    @white_knight2, @white_queen, @white_rook1,
                    @white_rook2, @black_bishop1, @black_bishop2, 
                    @black_king, @black_knight1, @black_knight2, 
                    @black_pawn1, @black_pawn2, @black_pawn3, 
                    @black_pawn4, @black_pawn5, @black_pawn6, 
                    @black_pawn7, @black_pawn8, @black_queen, 
                    @black_rook1, @black_rook2]
  end

end



class Board < Game
  
  def initialize
    @board_coord = []
    x = 1
    while x < 9
      y = 1
      while y < 9
        @board_coord.push([x,y])
        y += 1
      end
      x += 1
    end
    display_board
  end
  
  def display_board
    
  end
  
end

class Rook
  attr_accessor :coord, :color
  attr_reader :icon
  
  def initialize(coord, color)
    @coord = coord
    @color = color
    case
    when @color == "black"
      @icon = "♜"
    when @color == "white"
      @icon = "♖"
    end
  end
  
  def valid_moves
    
  end
end

class Knight
  attr_accessor :coord, :color
  attr_reader :icon
  
  
  def initialize(coord, color)
    @coord = coord
    case
    when @color == "black"
      @icon = "♞"
    when @color == "white"
      @icon = "♘"
    end
    
  end
  
  def valid_moves
  end
  
end

class Bishop
  attr_accessor :coord, :color
  attr_reader :icon
  
  def initialize(coord, color)
    @coord = coord
    case
    when @color == "black"
      @icon = "♝"	
    when @color == "white"
      @icon = "♗"
    end
    
  end
  
  def valid_moves
  end
  
  
end

class Queen
  attr_accessor :coord, :color
  attr_reader :icon
  
  def initialize(coord, color)
    @coord = coord
    case
    when @color == "black"
      @icon = "♛"
    when @color == "white"
      @icon = "♕"
    end
    
  end
  
  def valid_moves
  end
  
  
end

class King
  attr_accessor :coord, :color
  attr_reader :icon
  
  def initialize(coord, color)
    @coord = coord
    case
    when @color == "black"
      @icon = "♚"
    when @color == "white"
      @icon = "♔"
    end
  end
  
  def valid_moves
  end
  
  
end

class Pawn
  attr_accessor :coord, :color
  attr_reader :icon
  
  def initialize(coord, color)
    @coord = coord
    case
    when @color == "black"
      @icon = "♟"
    when @color == "white"
      @icon = "♙"
    end
  end
  
  def valid_moves
  end
  
  
end

class Node

  attr_accessor :coord, :level, :child1, :child2, :child3, :child4, :child5, :child6, :child7, :child8, :parent

  def initialize(coord, level, parent)
    @coord = coord
    @level = level
    @child1 = nil
    @child2 = nil
    @child3 = nil
    @child4 = nil
    @child5 = nil
    @child6 = nil
    @child7 = nil
    @child8 = nil
    @parent = parent
  end

end

a = Game.new
