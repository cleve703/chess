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

end

class Pawn < Pieces
  attr_accessor :coord, :color, :icon

  def initialize(coord, color)
    @coord = coord
    @color = color
    case
    when @color == "black"
      @icon = "♟".black
    when @color == "white"
      @icon = "♙".black
    end
  end

end

