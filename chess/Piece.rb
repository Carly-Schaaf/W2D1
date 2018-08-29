module Slideable
  def get_unblocked_moves(dir)
    moves = []
    current_pos = @current_pos.dup

    current_pos[0] += dir[0]
    current_pos[1] += dir[1]

    while valid?(current_pos)
      break unless board[current_pos].is_a? (NullPiece)

      moves << current_pos.dup
      current_pos[0] += dir[0]
      current_pos[1] += dir[1]
    end
  end

  def get_move_options
    @move_dirs.each do |dir|
      @my_move_options += get_unblocked_moves(dir)
    end
    p @my_move_options
  end

  def valid?(pos)
    row, col = pos
    return false unless row.between?(0,7)
    return false unless col.between?(0,7)
    true
  end


end

class Piece

  attr_accessor :current_pos, :color, :board, :my_move_options, :move_dirs

  def initialize(starting_pos, color, board)
    @current_pos = starting_pos
    @color = color
    @board = board
    @my_move_options = []
  end

  def empty?
    return true if self.is_a?(NullPiece)
    false
  end

  def valid_moves; end

  def pos=(value)
    @current_pos = value
  end

  def move_into_check(end_pos) ; end
end


class King < Piece


  def to_s
    return "  ♔  " if @color == :white
    return "  ♚  " if @color == :black
  end
end

class Queen < Piece
  include Slideable

  def initialize(starting_pos, color, board)
    @move_dirs = [ [1,1], [1, -1], [-1, 1], [ -1,-1], [1,0], [0,1], [-1, 0], [ 0,-1] ]
    super
  end

  # def get_move_options
  #   @move_dirs.each do |dir|
  #     @my_move_options += get_unblocked_moves(dir)
  #   end
  # end

  def to_s
    return "  ♕  " if @color == :white
    return "  ♛  " if @color == :black
  end
end

class Bishop < Piece
  include Slideable

  def initialize(starting_pos, color, board)
    @move_dirs = [ [1,1], [1, -1], [-1, 1], [ -1,-1] ]
    super
  end

  def to_s
    return "  ♗  " if @color == :white
    return "  ♝  " if @color == :black
  end
end

class Knight < Piece

  def to_s
    return "  ♘  " if @color == :white
    return "  ♞  " if @color == :black
  end
end

class Rook < Piece
  include Slideable

  def initialize(starting_pos, color, board)
    @move_dirs = [ [1,0], [0,1], [-1, 0], [ 0,-1] ]
    super
  end

  def to_s
    return "  ♖  " if @color == :white
    return "  ♜  " if @color == :black
  end
end

class Pawn < Piece

  def to_s
    return "  ♙  " if @color == :white
    return "  ♟  " if @color == :black
  end
end
