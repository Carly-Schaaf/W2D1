require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each_with_index do |row, row_index|
      temp_row1 = []
      temp_row2 = []
      temp_row3 = []
      temp_row4 = []
      row.each_with_index do |el, col_index|
        if [row_index, col_index] == @cursor.cursor_pos && @cursor.selected
          color = :grey
        elsif [row_index, col_index] == @cursor.cursor_pos
          color = :red
        else
          color = (row_index + col_index).even? ? :blue : :green
        end
        temp_row1 << "      ".colorize(background: color)
        temp_row2 << "#{el.to_s} ".colorize(background: color)
        temp_row3 << "      ".colorize(background: color)
        temp_row4 << "      ".colorize(background: color)

      end

      # [temp_row1, temp_row2, temp_row3, temp_row4].each  {|row| row << "\n"}
      temp_row1 << "\n"
      temp_row2 << "\n"
      temp_row3 << "\n"
      temp_row4 << "\n"
      temp_row1.each {|row| print row}
      temp_row2.each {|row| print row}
      temp_row3.each {|row| print row}
      # temp_row4.each {|row| print row}
    end
    nil
  end

  def move_cursor
    until @cursor.selected == true
      @cursor.get_input
      p "am i working?"
      self.render
      # self.render
    end
    @board[@cursor.cursor_pos] = Rook.new(@cursor.cursor_pos, :white, @board)
    @board[@cursor.cursor_pos].get_move_options
  end


end
