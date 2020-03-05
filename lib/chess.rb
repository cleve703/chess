#!/usr/bin/ruby
require_relative './string.rb'
require_relative './board.rb'
require_relative './pieces.rb'

class Game
  attr_accessor :chess_pieces, :pieces
  
  def initialize
    create_pieces
    @board = Board.new(@pieces)
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
    @pieces = [@white_pawn1, @white_pawn2, @white_pawn3, @white_pawn4,
              @white_pawn5, @white_pawn6, @white_pawn7, @white_pawn8,
              @white_bishop1, @white_bishop2, @white_king, @white_knight1,
              @white_knight2, @white_rook1, @white_rook2, @white_queen,
              @black_pawn1, @black_pawn2, @black_pawn3, @black_pawn4,
              @black_pawn5, @black_pawn6, @black_pawn7, @black_pawn8,
              @black_rook1, @black_rook2, @black_knight1, @black_knight2,
              @black_bishop1, @black_bishop2, @black_queen, @black_king]
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
    valid_initial_coord = false
    while valid_initial_coord == false
      puts "#{color.upcase}'s turn. Enter the grid coordinates of the piece you want to move: "
      cur_coord = @board.translate(gets.chomp.downcase)
      if @board.validate_cur_coord(color, cur_coord) == true
        valid_initial_coord = true
      else
        puts "Invalid selection, try again...".red
        valid_initial_coord = false
      end
    end
    valid_dest_coord = false
    while valid_dest_coord == false
      puts "#{color.upcase} - Enter the desired destination coordinates, or type RESTART: "
      new_coord = gets.chomp.downcase
      if new_coord == "restart"
        turn(color)
        break
      end
      new_coord = @board.translate(new_coord)
      if !@board.board_coord.include?(new_coord)
        puts "Try again, dummy.  This time select grid coordinates that are on the board.".red
        puts ""
        valid_dest_coord = false
      elsif @board.validate_cur_coord(color, new_coord) == true
        puts "Don't be silly.  You can't move to a space already occupied by the same color!".red
        puts ""
        valid_dest_coord = false
      elsif @board.ret_board_hash_piece(cur_coord).valid_moves(new_coord) == true
        @board.move_piece(cur_coord, new_coord)
        valid_dest_coord = true
      elsif @board.ret_board_hash_piece(cur_coord).valid_moves(new_coord) == false
        puts "That piece can't move to the destination selected.  Try again.".red
        puts ""
      end
    end
  end
    
end

Game.new