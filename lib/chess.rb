#!/usr/bin/ruby

class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}" end
  def green;          "\e[32m#{self}" end
  def brown;          "\e[33m#{self}" end
  def blue;           "\e[34m#{self}" end
  def magenta;        "\e[35m#{self}" end
  def cyan;           "\e[36m#{self}" end
  def gray;           "\e[37m#{self}" end
  
  def bg_black;       "\e[40m#{self}" end
  def bg_red;         "\e[41m#{self}" end
  def bg_green;       "\e[42m#{self}" end
  def bg_brown;       "\e[43m#{self}" end
  def bg_blue;        "\e[44m#{self}" end
  def bg_magenta;     "\e[45m#{self}" end
  def bg_cyan;        "\e[46m#{self}" end
  def bg_gray;        "\e[47m#{self}" end
  
  def bold;           "\e[1m#{self}\e[22m" end
  def italic;         "\e[3m#{self}\e[23m" end
  def underline;      "\e[4m#{self}\e[24m" end
  def blink;          "\e[5m#{self}\e[25m" end
  def reverse_color;  "\e[7m#{self}\e[27m" end
end

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
    @pieces = [@white_pawn1, @white_pawn2, @white_pawn3, 
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
    update_board
  end

  def update_board
    @pieces.each do |piece|
      @board.assign_coord(piece.coord, piece)
    end
    display_board
  end

  def display_board
    puts "       "
    puts "       " + "   a   " + "   b   " + "   c   " + "   d   " + "   e   " + "   f   " + "   g   " + "   h   "
    puts "       "
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "   8   " + "   #{@board.ret_board_hash_val([1,8])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([2,8])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([3,8])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([4,8])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([5,8])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([6,8])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([7,8])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([8,8])}".bg_gray + "   ".bg_gray + "   8".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "   7   " + "   #{@board.ret_board_hash_val([1,7])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([2,7])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([3,7])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([4,7])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([5,7])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([6,7])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([7,7])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([8,7])}".bg_cyan + "   ".bg_cyan + "   7".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "   6   " + "   #{@board.ret_board_hash_val([1,6])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([2,6])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([3,6])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([4,6])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([5,6])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([6,6])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([7,6])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([8,6])}".bg_gray + "   ".bg_gray + "   6".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "   5   " + "   #{@board.ret_board_hash_val([1,5])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([2,5])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([3,5])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([4,5])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([5,5])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([6,5])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([7,5])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([8,5])}".bg_cyan + "   ".bg_cyan + "   5".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "   4   " + "   #{@board.ret_board_hash_val([1,4])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([2,4])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([3,4])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([4,4])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([5,4])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([6,4])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([7,4])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([8,4])}".bg_gray + "   ".bg_gray + "   4".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "   3   " + "   #{@board.ret_board_hash_val([1,3])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([2,3])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([3,3])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([4,3])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([5,3])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([6,3])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([7,3])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([8,3])}".bg_cyan + "   ".bg_cyan + "   3".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "   2   " + "   #{@board.ret_board_hash_val([1,2])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([2,2])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([3,2])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([4,2])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([5,2])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([6,2])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([7,2])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([8,2])}".bg_gray + "   ".bg_gray + "   2".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "   1   " + "   #{@board.ret_board_hash_val([1,1])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([2,1])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([3,1])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([4,1])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([5,1])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([6,1])}".bg_cyan + "   ".bg_cyan + "   #{@board.ret_board_hash_val([7,1])}".bg_gray + "   ".bg_gray + "   #{@board.ret_board_hash_val([8,1])}".bg_cyan + "   ".bg_cyan + "   1".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "       "
    puts "       " + "   a   " + "   b   " + "   c   " + "   d   " + "   e   " + "   f   " + "   g   " + "   h   "
    puts "       "
  end

end

class Board
  attr_accessor :board_hash
  
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
    board_hash
  end
  
  def board_hash
    @board_hash = Hash.new
    @board_coord.each do |coord|
      @board_hash[coord] = nil
    end 
  end

  def assign_coord(coord, piece)
    @board_hash[coord] = piece
  end

  def ret_board_hash_val(key)
    if @board_hash[key].nil?
      return " "
    else
      @board_hash[key].icon
    end
  end
  
end



class King 
  attr_accessor :coord, :color, :icon

  def initialize(coord, color)
    @coord = coord
    @color = color
    case
    when @color == "black"
      @icon = "♚".black
    when @color == "white"
      @icon = "♔".black
    end
  end

end

class Queen 
  attr_accessor :coord, :color, :icon

  def initialize(coord, color)
    @coord = coord
    @color = color
    case
    when @color == "black"
      @icon = "♛".black
    when @color == "white"
      @icon = "♕".black
    end
  end

end

class Rook 
  attr_accessor :coord, :color, :icon

  def initialize(coord, color)
    @coord = coord
    @color = color
    case
    when @color == "black"
      @icon = "♜".black
    when @color == "white"
      @icon = "♖".black
    end
  end

end

class Bishop 
  attr_accessor :coord, :color, :icon

  def initialize(coord, color)
    @coord = coord
    @color = color
    case
    when @color == "black"
      @icon = "♝".black
    when @color == "white"
      @icon = "♗".black
    end
  end

end

class Knight
  attr_accessor :coord, :color, :icon

  def initialize(coord, color)
    @coord = coord
    @color = color
    case
    when @color == "black"
      @icon = "♞".black
    when @color == "white"
      @icon = "♘".black
    end
  end

end

class Pawn 
  attr_accessor :coord, :color, :icon

  def initialize(coord, color)
    @coord = coord
    @color = color
    case
    when @color == "black"
      @icon = "♟".black
    when @color == "white"
      @icon = "♙".black
    end
  end

end


Game.new