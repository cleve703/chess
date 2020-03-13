#!/usr/bin/ruby
require_relative './string.rb'
require_relative './board.rb'
require_relative './pieces.rb'

class Game
  attr_accessor 
  
  def initialize
    @board = Board.new
    @in_check = false
    @game_over = false
    turn_sequence
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

  def turn(my_color)
    if my_color == "black"
      opp_color = "white"
    elsif my_color == "white"
      opp_color = "black"
    end
    @board.display_board
    if analyze_board_check(my_color, @board.board_hash) == true
      if analyze_board_check_mate(my_color) == true
        puts "CHECK MATE - #{opp_color} wins!"
        puts ""
      else
        puts "#{my_color.upcase} - You are in check! You must make a move to get out of check.".red
        puts ""
      end
    end
    cur_coord = input_starting_coord(my_color, opp_color)
    input_ending_coord(my_color, opp_color, cur_coord)
  end
  
  def input_starting_coord(color, opp_color)
    valid_initial_coord = false
    while valid_initial_coord == false
      puts "#{color.upcase}'s turn. Enter the grid coordinates of the piece you want to move: "
      cur_coord = @board.translate(gets.chomp.downcase)
      if @board.board_hash[cur_coord].nil?
        puts "Invalid selection, try again...".red
        puts ""
      elsif @board.board_hash[cur_coord].color == color
        valid_initial_coord = true
        return cur_coord
      else
        puts "Invalid selection, try again...".red
        puts ""
      end
    end
  end

  def input_ending_coord(color, opp_color, cur_coord)
    valid_dest_coord = false
    board_hash = @board.board_hash
    while valid_dest_coord == false
      @board.copy_board_hash
      temp_board_hash = @board.temp_board_hash
      piece = temp_board_hash[cur_coord]
      puts "#{color.upcase} - Enter the desired destination coordinates, or type RESTART: "
      new_coord = gets.chomp.downcase
      if new_coord == "restart"
        turn(color)
        break
      end
      new_coord = @board.translate(new_coord)
      case
      when !space_exists?(temp_board_hash, new_coord)
        puts "Must select a space that's on the board. Try again!".red
        puts ""
        valid_dest_coord = false
      when color_match?(color, temp_board_hash, new_coord) == true
        puts "Can't move to a space already occupied by your own color. Try again!".red
        puts ""
      when color_match?(color, temp_board_hash, new_coord) == false
        if temp_board_hash[cur_coord].valid_moves(cur_coord, new_coord, true, board_hash) == true
          @board.attack_piece(cur_coord, new_coord, temp_board_hash, @board.temp_dead_pieces, @board.temp_active_pieces)
          if analyze_board_check(color, temp_board_hash) == true
            puts "This move results in you being in check - illegal move. Try again!".red
            puts ""
          else
            @board.attack_piece(cur_coord, new_coord, board_hash, @board.dead_pieces, @board.pieces)
            increase_move_count(board_hash, new_coord)
            valid_dest_coord = true
          end
        else
          puts "You can't move the #{piece.name} to that space right now. Try again!".red
          puts ""
        end
      when space_empty?(temp_board_hash, new_coord) == true
        if temp_board_hash[cur_coord].valid_moves(cur_coord, new_coord, false, board_hash) == true
          @board.move_piece(cur_coord, new_coord, temp_board_hash)
          if analyze_board_check(color, temp_board_hash) == true
            puts "This move results in you being in check - illegal move. Try again!".red
            puts ""
          else
            @board.move_piece(cur_coord, new_coord, board_hash)
            increase_move_count(board_hash, new_coord)
            valid_dest_coord = true
          end
        else
          puts "You can't move the #{piece.name} to that space right now. Try again!".red
          puts ""
        end
      end
    end
  end

  def space_exists?(test_hash, coord)
    if test_hash.has_key?(coord)
      return true
    else
      return false
    end
  end

  def color_match?(test_color, test_hash, coord)
    if test_hash[coord].nil?
    elsif test_hash[coord].color == test_color
      return true
    else
      return false
    end
  end

  def space_empty?(test_hash, coord)
    if test_hash[coord].nil?
      return true
    else
      return false
    end
  end

  def increase_move_count(test_hash, coord)
    test_hash[coord].move_count += 1
  end

  def analyze_board_check(my_color, test_hash)
    # returns true if given color is in check
    if my_color == "black"
      opp_color = "white"
    elsif my_color == "white"
      opp_color = "black"
    end
    if my_color == "black"
      king = @board.black_king
    elsif my_color == "white"
      king = @board.white_king
    end
    opp_pieces = []
    @board.pieces.each do |piece|
      opp_pieces.push(piece) if piece.color == opp_color && !test_hash.key(piece).nil?
    end
    opp_pieces.each do |piece|
      if piece.valid_moves(test_hash.key(piece), test_hash.key(king), true, test_hash) == true
        puts "#{my_color.upcase} King is in check!".red
        puts ""
        return true
      end
    end
    return false
  end

  def analyze_board_check_mate(my_color)
    if my_color == "black"
      opp_color = "white"
    elsif my_color == "white"
      opp_color = "black"
    end
    
  end
   
end

Game.new