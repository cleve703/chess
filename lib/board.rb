class Board
  attr_accessor :board_hash, :board_coord
  
  def initialize(pieces)
    @pieces = pieces
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
    update_board
  end
  
  def board_hash
    @board_hash = Hash.new
    @board_coord.each do |coord|
      @board_hash[coord] = nil
    end 
  end

  def ret_board_hash
    @board_hash
  end
  
  def assign_coord(coord, piece)
    @board_hash[coord] = piece
  end
  
  def ret_board_hash_icon(key)
    if @board_hash[key].nil?
      return " "
    else
      @board_hash[key].icon
    end
  end
  
  def ret_board_hash_color(cur_coord)
    if @board_hash[cur_coord].nil?
      return false
    else
      @board_hash[cur_coord].color
    end
  end
  
  def ret_board_hash_piece(cur_coord)
    @board_hash[cur_coord]
  end
  
  def update_board
    board_hash
    @pieces.each do |piece|
      assign_coord(piece.coord, piece)
    end
    display_board
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
    if ret_board_hash_color(cur_coord) == color
      return true
    else
      return false
    end
  end
  
  def move_piece(cur_coord, new_coord)
    piece = ret_board_hash_piece(cur_coord)
    piece.coord = new_coord
    update_board
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