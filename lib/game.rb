class Game

  def initialize(saved_game=false, game_data=false)
    @game_over = false
    @saved_game = saved_game
    if @saved_game == false
      @board = Board.new
      turn_sequence
    else
      @board = Board.new(true, game_data)
      turn_sequence(game_data.total_move_count)
    end
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
      if analyze_board_check_mate(my_color, @board.board_hash) == true
        puts "CHECK MATE - #{opp_color} wins!"
        puts ""
      else
        puts "#{my_color.upcase} - You are in check! You must make a move to get out of check.".red
        puts ""
      end
    end
    cur_coord = input_starting_coord(my_color, opp_color)
  end
  
  def input_starting_coord(my_color, opp_color)
    valid_initial_coord = false
    while valid_initial_coord == false
      puts "#{my_color.upcase}'s turn. Enter \"S\" to save or \"Q\" to quit. Otherwise..."
      puts "Enter the grid coordinates of the piece you want to move: "
      cur_coord = gets.chomp.downcase
      if cur_coord == "s"
        save_to_file
        valid_initial_coord = true
        @game_over = true
        break
      elsif cur_coord == "q"
        valid_initial_coord = true
        @game_over = true
        break
      end
      cur_coord = @board.translate(cur_coord)
      if @board.board_hash[cur_coord].nil?
        puts "Invalid selection, try again...".red
        puts ""
      elsif @board.board_hash[cur_coord].color == my_color
        valid_initial_coord = true
        input_ending_coord(my_color, opp_color, cur_coord)
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

  def analyze_board_check(my_color, test_hash, mute=false)
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
        puts "#{my_color.upcase} King is in check!".red unless mute == true
        puts "" unless mute == true
        return true
      end
    end
    return false
  end

  def analyze_board_check_mate(my_color, test_hash)
    # returns true if given color is in check mate
    if my_color == "black"
      opp_color = "white"
    elsif my_color == "white"
      opp_color = "black"
    end
    coordinates_possible_moves = []
    @board.board_coord.each do |coord|
      if @board.board_hash[coord].nil? || @board.board_hash[coord].color == opp_color
        coordinates_possible_moves.push(coord)
      end
    end
    my_pieces_coord = []
    @board.pieces.each do |piece|
      if piece.color == my_color && !test_hash.key(piece).nil?
        my_pieces_coord.push(test_hash.key(piece))
      end
    end
    my_pieces_coord.each do |cur_coord|
      coordinates_possible_moves.each do |new_coord|
        @board.copy_board_hash
        temp_board_hash = @board.temp_board_hash
        case
        when color_match?(my_color, temp_board_hash, new_coord) == false
          if temp_board_hash[cur_coord].valid_moves(cur_coord, new_coord, true, temp_board_hash) == true
            @board.attack_piece(cur_coord, new_coord, temp_board_hash, @board.temp_dead_pieces, @board.temp_active_pieces)
            if analyze_board_check(my_color, temp_board_hash, true) == true
            else
              return false
            end
          end
        when space_empty?(temp_board_hash, new_coord) == true
          if temp_board_hash[cur_coord].valid_moves(cur_coord, new_coord, false, temp_board_hash) == true
            @board.move_piece(cur_coord, new_coord, temp_board_hash)
            if analyze_board_check(my_color, temp_board_hash, true) == true
            else
              return false
            end
          end
        end
      end
    end
    @game_over = true
    return true
  end

  def save_to_file
    time = Time.new
    default_filename = time.strftime('%Y%m%d%H%m%S')
    board = @board
    File.open("./yaml/#{default_filename}.yml", 'w') { |f| f.write(board.to_yaml) }
    puts %Q(
      File was saved as #{default_filename}.
      Press [ENTER]
    )
    gets.chomp
  end

end