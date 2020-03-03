class Pieces
  def initialize
  end
end

class King < Pieces
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

class Queen < Pieces
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

class Rook < Pieces
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
    when @coord[0] == new_coord[0]
      return true
    when @coord[1] == new_coord[1]
      return true
    else
      return false
    end
  end

end

class Bishop < Pieces
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

class Knight < Pieces
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

class Pawn < Pieces
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

