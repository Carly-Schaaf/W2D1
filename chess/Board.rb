require_relative "piece"
require_relative "NullPiece"

class Board

  attr_accessor :grid

  def initialize
    # @grid = Array.new(8, Array.new(8, NullPiece.new))
    @grid = Array.new( 8) {Array.new(8) { NullPiece.new} }
  end

  def move_piece(start_pos, end_pos)
    unless self[start_pos].is_a?(Piece)
      raise NoPieceError
    end
    # unless self[end_pos].is_valid_move#come back
    #   raise InvalidMoveError
    # end
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
    # piece.current_pos = end_pos
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

end

class NoPieceError < StandardError
  def message
    "No piece at given square"
  end
end

class InvalidMoveError < StandardError
  def message
    "Cannot move to that end position"
  end
end
