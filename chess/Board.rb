require_relative "piece"
require_relative "NullPiece"
require_relative "DisplayClass"
require 'colorize'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new( 8) {Array.new(8) { NullPiece.new} }
    self.set_up_board
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
    piece.current_pos = end_pos
  end

  def set_up_board
    #place white pieces
    #rook, knight, bishop, Queen, king, bishop, knight rook
    self[[7,0]] = Rook.new([7,0], :white, self)
    self[[7,1]] = Knight.new([7,1], :white, self)
    self[[7,2]] = Bishop.new([7,2], :white, self)
    self[[7,3]] = Queen.new([7,3], :white, self)
    self[[7,4]] = King.new([7,4], :white, self)
    self[[7,5]] = Bishop.new([7,5], :white, self)
    self[[7,6]] = Knight.new([7,6], :white, self)
    self[[7,7]] = Rook.new([7,7], :white, self)

    (0..7).each do |col|
      self[[6,col]] = Pawn.new([6,col], :white, self)
    end

    self[[0,0]] = Rook.new([0,0], :black, self)
    self[[0,1]] = Knight.new([0,1], :black, self)
    self[[0,2]] = Bishop.new([0,2], :black, self)
    self[[0,4]] = Queen.new([0,4], :black, self)
    self[[0,3]] = King.new([0,3], :black, self)
    self[[0,5]] = Bishop.new([0,5], :black, self)
    self[[0,6]] = Knight.new([0,6], :black, self)
    self[[0,7]] = Rook.new([0,7], :black, self)

    (0..7).each do |col|
      self[[1,col]] = Pawn.new([1,col], :black, self)
    end

  # place black pieces
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

b = Board.new
display = Display.new(b)
