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

  def valid_moves(new_coord)
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

  def valid_moves(new_coord)
    i = 1
    while i < 8
      if @coord[0] + i == new_coord[0] && @coord[1] + i == new_coord[1]
        return true
      elsif @coord[0] + i == new_coord[0] && @coord[1] - i == new_coord[1]
        return true
      elsif @coord[0] - i == new_coord[0] && @coord[1] + i == new_coord[1]
        return true
      elsif @coord[0] - i == new_coord[0] && @coord[1] - i == new_coord[1]
        return true
      elsif @coord[0] + i == new_coord[0] && @coord[1] == new_coord[1]
        return true
      elsif @coord[0] - i == new_coord[0] && @coord[1] == new_coord[1]
        return true
      elsif @coord[0] == new_coord[0] && @coord[1] + i == new_coord[1]
        return true
      elsif @coord[0] == new_coord[0] && @coord[1] - i == new_coord[1]
        return true
      else
        i += 1
      end
    end
    return false
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

  def valid_moves(new_coord)
    case
    when @coord[0] == new_coord[0] && @coord[1] != new_coord[1]
      return true
    when @coord[1] == new_coord[1] && @coord[0] != new_coord[0]
      return true
    else
      return false
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

  def valid_moves(new_coord)
    i = 1
    while i < 8
      if @coord[0] + i == new_coord[0] && @coord[1] + i == new_coord[1]
        return true
      elsif @coord[0] + i == new_coord[0] && @coord[1] - i == new_coord[1]
        return true
      elsif @coord[0] - i == new_coord[0] && @coord[1] + i == new_coord[1]
        return true
      elsif @coord[0] - i == new_coord[0] && @coord[1] - i == new_coord[1]
        return true
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

  def valid_moves(new_coord)
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

  def valid_moves(new_coord)
    case
    when @first_move == true && color == "black" && @coord[0] == new_coord[0] && new_coord[1] == 5
      return true
    when @first_move == true && color == "white" && @coord[0] == new_coord[0] && new_coord[1] == 4
      return true
    when color == "black" && @coord[0] == new_coord[0] && new_coord[1] == (@coord[1] - 1)
      return true
    when color == "white" && @coord[0] == new_coord[0] && new_coord[1] == (@coord[1] + 1)
      return true
    else
      return false
    end
  end

end

