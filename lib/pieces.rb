class King
  attr_accessor :color, :icon, :move_count, :status
  attr_reader :name
  
  def initialize(color)
    @name = "King"
    @color = color
    @move_count = 0
    @status = "active"
    case
    when @color == "black"
      @icon = "♚".black
    when @color == "white"
      @icon = "♔".black
    end
  end

  def valid_moves(cur_coord, new_coord, attack, board_hash)
    case
    when cur_coord[0] == new_coord[0] && new_coord[1] == cur_coord[1] + 1
      return true
    when cur_coord[1] == new_coord[1] && new_coord[0] == cur_coord[0] + 1
      return true
    when cur_coord[0] == new_coord[0] && new_coord[1] == cur_coord[1] - 1
      return true
    when cur_coord[1] == new_coord[1] && new_coord[0] == cur_coord[0] - 1
      return true
    when new_coord[1] == cur_coord[1] + 1 && new_coord[0] == cur_coord[0] + 1
      return true
    when new_coord[1] == cur_coord[1] + 1 && new_coord[0] == cur_coord[0] - 1
      return true
    when new_coord[1] == cur_coord[1] - 1 && new_coord[0] == cur_coord[0] + 1
      return true
    when new_coord[1] == cur_coord[1] - 1 && new_coord[0] == cur_coord[0] - 1
      return true
    else
      return false
    end
  end

end

class Queen
  attr_accessor :color, :icon, :move_count, :status
  attr_reader :name

  def initialize(color)
    @color = color
    @name = "Queen"
    @move_count = 0
    @status = "active"
    case
    when @color == "black"
      @icon = "♛".black
    when @color == "white"
      @icon = "♕".black
    end
  end

  def valid_moves(cur_coord, new_coord, attack, board_hash)
    i = 1
    zero_plus_path = []
    zero_minus_path = []
    plus_zero_path = []
    minus_zero_path = []
    plus_plus_path = []
    plus_minus_path = []
    minus_plus_path = []
    minus_minus_path = []
    while i < 8
      plus_zero_path.push(board_hash[[cur_coord[0] + i, cur_coord[1]]].nil?)
      minus_zero_path.push(board_hash[[cur_coord[0] - i, cur_coord[1]]].nil?)
      zero_plus_path.push(board_hash[[cur_coord[0], cur_coord[1] + i]].nil?)
      zero_minus_path.push(board_hash[[cur_coord[0], cur_coord[1] - i]].nil?)
      plus_plus_path.push(board_hash[[cur_coord[0] + i, cur_coord[1] + i]].nil?)
      plus_minus_path.push(board_hash[[cur_coord[0] + i, cur_coord[1] - i]].nil?)
      minus_plus_path.push(board_hash[[cur_coord[0] - i, cur_coord[1] + i]].nil?)
      minus_minus_path.push(board_hash[[cur_coord[0] - i, cur_coord[1] - i]].nil?)
      case
      when cur_coord[0] == new_coord[0] && cur_coord[1] + i == new_coord[1]
        temp = zero_plus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[0] == new_coord[0] && cur_coord[1] - i == new_coord[1]
        temp = zero_minus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[1] == new_coord[1] && cur_coord[0] + i == new_coord[0]
        temp = plus_zero_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[1] == new_coord[1] && cur_coord[0] - i == new_coord[0]
        temp = minus_zero_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[0] + i == new_coord[0] && cur_coord[1] + i == new_coord[1]
        temp = plus_plus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[0] + i == new_coord[0] && cur_coord[1] - i == new_coord[1]
        temp = plus_minus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[0] - i == new_coord[0] && cur_coord[1] + i == new_coord[1]
        temp = minus_plus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[0] - i == new_coord[0] && cur_coord[1] - i == new_coord[1]
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

class Rook
  attr_accessor :color, :icon, :move_count, :status
  attr_reader :name

  def initialize(color)
    @name = "Rook"
    @color = color
    @move_count = 0
    @status = "active"
    case
    when @color == "black"
      @icon = "♜".black
    when @color == "white"
      @icon = "♖".black
    end
  end

  def valid_moves(cur_coord, new_coord, attack, board_hash)
    i = 1
    zero_plus_path = []
    zero_minus_path = []
    plus_zero_path = []
    minus_zero_path = []
    while i < 8
      plus_zero_path.push(board_hash[[cur_coord[0] + i, cur_coord[1]]].nil?)
      minus_zero_path.push(board_hash[[cur_coord[0] - i, cur_coord[1]]].nil?)
      zero_plus_path.push(board_hash[[cur_coord[0], cur_coord[1] + i]].nil?)
      zero_minus_path.push(board_hash[[cur_coord[0], cur_coord[1] - i]].nil?)
      case
      when cur_coord[0] == new_coord[0] && cur_coord[1] + i == new_coord[1]
        temp = zero_plus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[0] == new_coord[0] && cur_coord[1] - i == new_coord[1]
        temp = zero_minus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[1] == new_coord[1] && cur_coord[0] + i == new_coord[0]
        temp = plus_zero_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[1] == new_coord[1] && cur_coord[0] - i == new_coord[0]
        temp = minus_zero_path
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
  attr_accessor :color, :icon, :move_count, :status
  attr_reader :name

  def initialize(color)
    @name = "Bishop"
    @color = color
    @move_count = 0
    @status = "active"
    case
    when @color == "black"
      @icon = "♝".black
    when @color == "white"
      @icon = "♗".black
    end
  end

  def valid_moves(cur_coord, new_coord, attack, board_hash)
    i = 1
    plus_plus_path = []
    plus_minus_path = []
    minus_plus_path = []
    minus_minus_path = []
    while i < 8
      plus_plus_path.push(board_hash[[cur_coord[0] + i, cur_coord[1] + i]].nil?)
      plus_minus_path.push(board_hash[[cur_coord[0] + i, cur_coord[1] - i]].nil?)
      minus_plus_path.push(board_hash[[cur_coord[0] - i, cur_coord[1] + i]].nil?)
      minus_minus_path.push(board_hash[[cur_coord[0] - i, cur_coord[1] - i]].nil?)
      case
      when cur_coord[0] + i == new_coord[0] && cur_coord[1] + i == new_coord[1]
        temp = plus_plus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[0] + i == new_coord[0] && cur_coord[1] - i == new_coord[1]
        temp = plus_minus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[0] - i == new_coord[0] && cur_coord[1] + i == new_coord[1]
        temp = minus_plus_path
        temp.pop
        return true if !temp.include?(false)
        i += 1
      when cur_coord[0] - i == new_coord[0] && cur_coord[1] - i == new_coord[1]
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
  attr_accessor :color, :icon, :move_count, :status
  attr_reader :name

  def initialize(color)
    @name = "Knight"
    @color = color
    @move_count = 0
    @status = "active"
    case
    when @color == "black"
      @icon = "♞".black
    when @color == "white"
      @icon = "♘".black
    end
  end

  def valid_moves(cur_coord, new_coord, attack, board_hash)
    case
    when cur_coord[0] + 1 == new_coord[0] && cur_coord[1] + 2 == new_coord[1]
      return true
    when cur_coord[0] + 2 == new_coord[0] && cur_coord[1] + 1 == new_coord[1]
      return true
    when cur_coord[0] - 1 == new_coord[0] && cur_coord[1] + 2 == new_coord[1]
      return true
    when cur_coord[0] - 2 == new_coord[0] && cur_coord[1] + 1 == new_coord[1]
      return true
    when cur_coord[0] + 1 == new_coord[0] && cur_coord[1] - 2 == new_coord[1]
      return true
    when cur_coord[0] + 2 == new_coord[0] && cur_coord[1] - 1 == new_coord[1]
      return true
    when cur_coord[0] - 1 == new_coord[0] && cur_coord[1] - 2 == new_coord[1]
      return true
    when cur_coord[0] - 2 == new_coord[0] && cur_coord[1] - 1 == new_coord[1]
      return true
    else
      return false
    end
  end

end

class Pawn
  attr_accessor :color, :icon, :move_count, :status
  attr_reader :name

  def initialize(color)
    @name = "Pawn"
    @color = color
    @move_count = 0
    @status = "active"
    case
    when @color == "black"
      @icon = "♟".black
    when @color == "white"
      @icon = "♙".black
    end
  end

  def valid_moves(cur_coord, new_coord, attack, board_hash)
    case
    when attack == false && @move_count == 0 && @color == "black" && cur_coord[0] == new_coord[0] && new_coord[1] == 5
      return true
    when attack == false && @move_count == 0 && @color == "white" && cur_coord[0] == new_coord[0] && new_coord[1] == 4
      return true
    when attack == false && @color == "black" && cur_coord[0] == new_coord[0] && new_coord[1] == (cur_coord[1] - 1)
      return true
    when attack == false && @color == "white" && cur_coord[0] == new_coord[0] && new_coord[1] == (cur_coord[1] + 1)
      return true
    when attack == true && @color == "black" && ((cur_coord[0] + 1 == new_coord[0]) || (cur_coord[0] - 1 == new_coord[0])) && new_coord[1] == (cur_coord[1] - 1)
      return true
    when attack == true && @color == "white" && ((cur_coord[0] + 1 == new_coord[0]) || (cur_coord[0] - 1 == new_coord[0])) && new_coord[1] == (cur_coord[1] + 1)
      return true
    else
      return false
    end
  end

end

