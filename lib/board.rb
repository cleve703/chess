class Board
  attr_accessor :board_hash, :board_coord, :temp_board_hash
  attr_reader :black_king, :white_king, :pieces, :temp_dead_pieces, :dead_pieces, :temp_active_pieces, :white_rook1, :white_rook2, :white_bishop1, :white_bishop2
  
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
    create_pieces
    create_board_hash
  end
  
  def create_pieces
    @white_pawn1 = Pawn.new("white")
    @white_pawn2 = Pawn.new("white")
    @white_pawn3 = Pawn.new("white")
    @white_pawn4 = Pawn.new("white")
    @white_pawn5 = Pawn.new("white")
    @white_pawn6 = Pawn.new("white")
    @white_pawn7 = Pawn.new("white")
    @white_pawn8 = Pawn.new("white")
    @white_rook1 = Rook.new("white")
    @white_rook2 = Rook.new("white")
    @white_knight1 = Knight.new("white")
    @white_knight2 = Knight.new("white")
    @white_bishop1 = Bishop.new("white")
    @white_bishop2 = Bishop.new("white")
    @white_king = King.new("white")
    @white_queen = Queen.new("white")
    @black_pawn1 = Pawn.new("black")
    @black_pawn2 = Pawn.new("black")
    @black_pawn3 = Pawn.new("black")
    @black_pawn4 = Pawn.new("black")
    @black_pawn5 = Pawn.new("black")
    @black_pawn6 = Pawn.new("black")
    @black_pawn7 = Pawn.new("black")
    @black_pawn8 = Pawn.new("black")
    @black_rook1 = Rook.new("black")
    @black_rook2 = Rook.new("black")
    @black_knight1 = Knight.new("black")
    @black_knight2 = Knight.new("black")
    @black_bishop1 = Bishop.new("black")
    @black_bishop2 = Bishop.new("black")
    @black_queen = Queen.new("black")
    @black_king = King.new("black")
    @pieces = [@white_pawn1, @white_pawn2, @white_pawn3, @white_pawn4,
              @white_pawn5, @white_pawn6, @white_pawn7, @white_pawn8,
              @white_bishop1, @white_bishop2, @white_king, @white_knight1,
              @white_knight2, @white_rook1, @white_rook2, @white_queen,
              @black_pawn1, @black_pawn2, @black_pawn3, @black_pawn4,
              @black_pawn5, @black_pawn6, @black_pawn7, @black_pawn8,
              @black_rook1, @black_rook2, @black_knight1, @black_knight2,
              @black_bishop1, @black_bishop2, @black_queen, @black_king]
    @dead_pieces = []
  end

  def create_board_hash
    @board_hash = Hash.new
    @board_coord.each do |coord|
      @board_hash[coord] = nil
    end
    @board_hash[[1,2]] = @white_pawn1
    @board_hash[[2,2]] = @white_pawn2
    @board_hash[[3,2]] = @white_pawn3
    @board_hash[[4,2]] = @white_pawn4
    @board_hash[[5,2]] = @white_pawn5
    @board_hash[[6,2]] = @white_pawn6
    @board_hash[[7,2]] = @white_pawn7
    @board_hash[[8,2]] = @white_pawn8
    @board_hash[[1,1]] = @white_rook1 
    @board_hash[[2,1]] = @white_knight1
    @board_hash[[3,1]] = @white_bishop1
    @board_hash[[4,1]] = @white_king
    @board_hash[[5,1]] = @white_queen
    @board_hash[[6,1]] = @white_bishop2
    @board_hash[[7,1]] = @white_knight2
    @board_hash[[8,1]] = @white_rook2
    @board_hash[[1,7]] = @black_pawn8
    @board_hash[[2,7]] = @black_pawn7
    @board_hash[[3,7]] = @black_pawn6
    @board_hash[[4,7]] = @black_pawn5
    @board_hash[[5,7]] = @black_pawn4
    @board_hash[[6,7]] = @black_pawn3
    @board_hash[[7,7]] = @black_pawn2
    @board_hash[[8,7]] = @black_pawn1
    @board_hash[[1,8]] = @black_rook2
    @board_hash[[2,8]] = @black_knight2
    @board_hash[[3,8]] = @black_bishop2
    @board_hash[[4,8]] = @black_queen
    @board_hash[[5,8]] = @black_king
    @board_hash[[6,8]] = @black_bishop1
    @board_hash[[7,8]] = @black_knight1
    @board_hash[[8,8]] = @black_rook1
  end
  
  def copy_board_hash
    @temp_board_hash = @board_hash.clone
    @temp_dead_pieces = @dead_pieces.clone
    @temp_active_pieces = @pieces.clone
  end

  def ret_board_hash_icon(key)
    if @board_hash[key].nil?
      return " "
    else
      @board_hash[key].icon
    end
  end
  
  def translate(cur_coord)
    numeric_coord = []
    case cur_coord[0]
    when "a"
      numeric_coord.push(1)
    when "b"
      numeric_coord.push(2)
    when "c"
      numeric_coord.push(3)
    when "d"
      numeric_coord.push(4)
    when "e"
      numeric_coord.push(5)
    when "f"
      numeric_coord.push(6)
    when "g"
      numeric_coord.push(7)
    when "h"
      numeric_coord.push(8)
    end
    numeric_coord.push(cur_coord[1].to_i)
    return numeric_coord
  end
  
  def validate_cur_coord(color, cur_coord)
    if @board_hash[cur_coord].color == color
      return true
    else
      return false
    end
  end
  
  def move_piece(cur_coord, new_coord, input_hash)
    piece = input_hash[cur_coord]
    input_hash[cur_coord] = nil
    input_hash[new_coord] = piece
  end

  def update_hash(piece, new_coord, input_hash)
    cur_coord = input_hash.key(piece)
    input_hash[cur_coord] = nil
    input_hash[new_coord] = piece
  end

  def attack_piece(cur_coord, new_coord, input_hash, dead_piece_array, active_piece_array)
    dead_piece_array.push(input_hash[new_coord])
    active_piece_array.delete(input_hash[new_coord])
    input_hash[new_coord] = nil
    move_piece(cur_coord, new_coord, input_hash)
  end
  
  def display_board
    puts "".bg_black
    puts "       ".bg_black
    puts "       " + "   a   " + "   b   " + "   c   " + "   d   " + "   e   " + "   f   " + "   g   " + "   h   ".bg_black
    puts "       ".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "   8   " + "   #{ret_board_hash_icon([1,8])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([2,8])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([3,8])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([4,8])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([5,8])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([6,8])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([7,8])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([8,8])}".bg_gray + "   ".bg_gray + "   8".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "   7   " + "   #{ret_board_hash_icon([1,7])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([2,7])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([3,7])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([4,7])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([5,7])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([6,7])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([7,7])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([8,7])}".bg_cyan + "   ".bg_cyan + "   7".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "   6   " + "   #{ret_board_hash_icon([1,6])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([2,6])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([3,6])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([4,6])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([5,6])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([6,6])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([7,6])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([8,6])}".bg_gray + "   ".bg_gray + "   6".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "   5   " + "   #{ret_board_hash_icon([1,5])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([2,5])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([3,5])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([4,5])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([5,5])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([6,5])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([7,5])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([8,5])}".bg_cyan + "   ".bg_cyan + "   5".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "   4   " + "   #{ret_board_hash_icon([1,4])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([2,4])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([3,4])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([4,4])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([5,4])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([6,4])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([7,4])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([8,4])}".bg_gray + "   ".bg_gray + "   4".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "   3   " + "   #{ret_board_hash_icon([1,3])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([2,3])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([3,3])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([4,3])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([5,3])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([6,3])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([7,3])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([8,3])}".bg_cyan + "   ".bg_cyan + "   3".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "   2   " + "   #{ret_board_hash_icon([1,2])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([2,2])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([3,2])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([4,2])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([5,2])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([6,2])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([7,2])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([8,2])}".bg_gray + "   ".bg_gray + "   2".bg_black
    puts "       " + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + " ".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "   1   " + "   #{ret_board_hash_icon([1,1])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([2,1])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([3,1])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([4,1])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([5,1])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([6,1])}".bg_cyan + "   ".bg_cyan + "   #{ret_board_hash_icon([7,1])}".bg_gray + "   ".bg_gray + "   #{ret_board_hash_icon([8,1])}".bg_cyan + "   ".bg_cyan + "   1".bg_black
    puts "       " + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + "       ".bg_gray + "       ".bg_cyan + " ".bg_black
    puts "       "
    puts "       " + "   a   " + "   b   " + "   c   " + "   d   " + "   e   " + "   f   " + "   g   " + "   h   "
    puts "       "
  end
  
end