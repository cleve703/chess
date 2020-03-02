#!/usr/bin/ruby
require_relative './string.rb'
require_relative './board.rb'
require_relative './pieces.rb'

class Game
  attr_accessor :chess_pieces, :white_pawn1, :white_pawn2, :white_pawn3
  
  def initialize
    create_pieces
    @board = Board.new
    @game_over = false
    turn_sequence
  end

  def create_pieces
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
  end
  
  def turn_sequence
    i = 1
    while @game_over == false
      if i.even?
        turn('black')
      else
        turn('white')
      end
      i += 1
    end
  end
  
  def turn(color)
    valid_answer_given = false
    while valid_answer_given ==false
      puts "#{color.upcase}'s turn. Enter the grid coordinates of the piece you want to move: "
      cur_coord = gets.chomp.downcase
      cur_coord = translate(cur_coord)
      if validate_cur_coord(color, cur_coord) == true
        valid_answer_given = true
      else
        puts "Invalid selection, try again..."
        valid_answer_given = false
      end
    end
    puts "#{color.upcase} - Enter the desired destination coordinates: "
    new_coord = gets.chomp.downcase
    new_coord = translate(new_coord)
    move_piece(cur_coord, new_coord)
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
    if @board.ret_board_hash_color(cur_coord) == color
      return true
    else
      return false
    end
  end
  
  def move_piece(cur_coord, new_coord)
    piece = @board.ret_board_hash_piece(cur_coord)
    piece.coord = new_coord
    update_board
  end
    
end

Game.new