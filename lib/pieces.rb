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

  def valid_moves(new_coord, board_hash)
    case
    when @coord[0] == new_coord[0] && new_coord[1] == @coord[1] + 1
      return true
    when @coord[1] == new_coord[1] && new_coord[0] == @coord[0] + 1
      return true
    when @coord[0] == new_coord[0] && new_coord[1] == @coord[1] - 1
      return true
    when @coord[1] == new_coord[1] && new_coord[0] == @coord[0] - 1
      return true
    when new_coord[1] == @coord[1] + 1 && new_coord[0] == @coord[0] + 1
      return true
    when new_coord[1] == @coord[1] + 1 && new_coord[0] == @coord[0] - 1
      return true
    when new_coord[1] == @coord[1] - 1 && new_coord[0] == @coord[0] + 1
      return true
    when new_coord[1] == @coord[1] - 1 && new_coord[0] == @coord[0] - 1
      return true
    else
      return false
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

  def valid_moves(new_coord, board_hash)
    valid_moves_array = []
    forward = true
    forward_right = true
    right = true
    backward_right = true
    backward = true
    backward_left = true
    left = true
    forward_left = true
    # forward
    i = 1
    while forward == true
      move = [@coord[0], @coord[1] + i]
      if !board_hash.has_key?(move)
        forward = false
      elsif board_hash[move].nil?
        valid_moves_array.push(move)
        i += 1
      elsif board_hash[move].color == @color
        forward = false
      elsif board_hash[move].color != @color
        valid_moves_array.push(move)
        forward = false
      end
    end
    # forward_right
    while forward_right == true
      move = [@coord[0] + i, @coord[1] +i]
      if !board_hash.has_key?(move)
        forward = false
      elsif board_hash[move].nil?
        valid_moves_array.push(move)
        i += 1
      elsif board_hash[move].color == @color
        forward = false
      elsif board_hash[move].color != @color
        valid_moves_array.push(move)
        forward = false
      end
    end
    # right
    while right == true
      move = [@coord[0] + i, @coord[1]]
      if !board_hash.has_key?(move)
        forward = false
      elsif board_hash[move].nil?
        valid_moves_array.push(move)
        i += 1
      elsif board_hash[move].color == @color
        forward = false
      elsif board_hash[move].color != @color
        valid_moves_array.push(move)
        forward = false
      end
    end
    # backward_right
    while backward_right == true
      move = [@coord[0] + i, @coord[1] - i]
      if !board_hash.has_key?(move)
        forward = false
      elsif board_hash[move].nil?
        valid_moves_array.push(move)
        i += 1
      elsif board_hash[move].color == @color
        forward = false
      elsif board_hash[move].color != @color
        valid_moves_array.push(move)
        forward = false
      end
    end
    # backward
    while backward == true
      move = [@coord[0] - i, @coord[1]]
      if !board_hash.has_key?(move)
        forward = false
      elsif board_hash[move].nil?
        valid_moves_array.push(move)
        i += 1
      elsif board_hash[move].color == @color
        forward = false
      elsif board_hash[move].color != @color
        valid_moves_array.push(move)
        forward = false
      end
    end
    # backward_left
    while backward_left == true
      move = [@coord[0] - i, @coord[1] - i]
      if !board_hash.has_key?(move)
        forward = false
      elsif board_hash[move].nil?
        valid_moves_array.push(move)
        i += 1
      elsif board_hash[move].color == @color
        forward = false
      elsif board_hash[move].color != @color
        valid_moves_array.push(move)
        forward = false
      end
    end
    # left
    while left == true
      move = [@coord[0] - i, @coord[1]]
      if !board_hash.has_key?(move)
        forward = false
      elsif board_hash[move].nil?
        valid_moves_array.push(move)
        i += 1
      elsif board_hash[move].color == @color
        forward = false
      elsif board_hash[move].color != @color
        valid_moves_array.push(move)
        forward = false
      end
    end
    # forward_left
    while forward_left == true
      move = [@coord[0] - i, @coord[1] + i]
      if !board_hash.has_key?(move)
        forward = false
      elsif board_hash[move].nil?
        valid_moves_array.push(move)
        i += 1
      elsif board_hash[move].color == @color
        forward = false
      elsif board_hash[move].color != @color
        valid_moves_array.push(move)
        forward = false
      end
    end
    if valid_moves_array.include?(new_coord)
      return true
    else
      return false
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

  def valid_moves(new_coord, board_hash)
    i = 1
    zero_plus_path = []
    zero_minus_path = []
    plus_zero_path = []
    minus_zero_path = []
    while i < 8
      plus_zero_path.push(board_hash[[@coord[0] + i, @coord[1]]].nil?)
      minus_zero_path.push(board_hash[[@coord[0] - i, @coord[1]]].nil?)
      zero_plus_path.push(board_hash[[@coord[0], @coord[1] + i]].nil?)
      zero_minus_path.push(board_hash[[@coord[0], @coord[1] - i]].nil?)
      case
      when @coord[0] == new_coord[0] && @coord[1] + i == new_coord[1]
        temp = zero_plus_path
        puts temp
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when @coord[0] == new_coord[0] && @coord[1] - i == new_coord[1]
        temp = zero_minus_path
        puts temp
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when @coord[1] == new_coord[1] && @coord[0] + i == new_coord[0]
        temp = plus_zero_path
        puts temp
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when @coord[1] == new_coord[1] && @coord[0] - i == new_coord[0]
        temp = minus_zero_path
        puts temp
        temp.pop
        return true if !temp.include?(false)
        i += 1
      else
        i += 1
      end
    end
    return false
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

  def valid_moves(new_coord, board_hash)
    i = 1
    plus_plus_path = []
    plus_minus_path = []
    minus_plus_path = []
    minus_minus_path = []
    while i < 8
      plus_plus_path.push(board_hash[[@coord[0] + i, @coord[1] + i]].nil?)
      plus_minus_path.push(board_hash[[@coord[0] + i, @coord[1] - i]].nil?)
      minus_plus_path.push(board_hash[[@coord[0] - i, @coord[1] + i]].nil?)
      minus_minus_path.push(board_hash[[@coord[0] - i, @coord[1] - i]].nil?)
      case
      when @coord[0] + i == new_coord[0] && @coord[1] + i == new_coord[1]
        temp = plus_plus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when @coord[0] + i == new_coord[0] && @coord[1] - i == new_coord[1]
        temp = plus_minus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when @coord[0] - i == new_coord[0] && @coord[1] + i == new_coord[1]
        temp = minus_plus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when @coord[0] - i == new_coord[0] && @coord[1] - i == new_coord[1]
        temp = minus_minus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      else
        i += 1
      end
    end
    return false
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

  def valid_moves(new_coord, board_hash)
    case
    when @coord[0] + 1 == new_coord[0] && @coord[1] + 2 == new_coord[1]
      return true
    when @coord[0] + 2 == new_coord[0] && @coord[1] + 1 == new_coord[1]
      return true
    when @coord[0] - 1 == new_coord[0] && @coord[1] + 2 == new_coord[1]
      return true
    when @coord[0] - 2 == new_coord[0] && @coord[1] + 1 == new_coord[1]
      return true
    when @coord[0] + 1 == new_coord[0] && @coord[1] - 2 == new_coord[1]
      return true
    when @coord[0] + 2 == new_coord[0] && @coord[1] - 1 == new_coord[1]
      return true
    when @coord[0] - 1 == new_coord[0] && @coord[1] - 2 == new_coord[1]
      return true
    when @coord[0] - 2 == new_coord[0] && @coord[1] - 1 == new_coord[1]
      return true
    else
      return false
    end
  end

end

class Pawn
  attr_accessor :coord, :color, :icon

  def initialize(coord, color)
    @coord = coord
    @color = color
    @first_move = true
    case
    when @color == "black"
      @icon = "♟".black
    when @color == "white"
      @icon = "♙".black
    end
  end

  def valid_moves(new_coord, board_hash)
    case
    when @first_move == true && color == "black" && @coord[0] == new_coord[0] && new_coord[1] == 5
      if board_hash[[@coord[0], 6]].nil? && board_hash[[@coord[0], 5]].nil?
      return true
      end
    when @first_move == true && color == "white" && @coord[0] == new_coord[0] && new_coord[1] == 4
      if board_hash[[@coord[0], 3]].nil? && board_hash[[@coord[0], 4]].nil?
      return true
      end
    when color == "black" && @coord[0] == new_coord[0] && new_coord[1] == (@coord[1] - 1)
      if board_hash[[new_coord]].nil?
      return true
      end
    when color == "white" && @coord[0] == new_coord[0] && new_coord[1] == (@coord[1] + 1)
      if board_hash[[new_coord]].nil?
      return true
      end
    when color == "black" && (@coord[0] + 1 || @coord[0] - 1) == new_coord[0] && new_coord[1] == (@coord[1] - 1)
      if board_hash[[new_coord]].color != @color
      return true
      end
    when color == "white" && (@coord[0] + 1 || @coord[0] - 1) == new_coord[0] && new_coord[1] == (@coord[1] + 1)
      if board_hash[[new_coord]].color != @color
      return true
      end
    else
      return false
    end
  end

end

