# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'

# Implement winning_conditions and draw condition
class Winning < Game
  def game_over?
    return 'it is a draw!' if draw?

    winning_conditions
  end

  protected

  def winning_conditions
    # Rows
    return @board[0] if @board[0] == @board[1] && @board[1] == @board[2]
    return @board[3] if @board[3] == @board[4] && @board[4] == @board[5]
    return @board[6] if @board[6] == @board[7] && @board[7] == @board[8]

    # Columns
    return @board[0] if @board[0] == @board[3] && @board[3] == @board[6]
    return @board[1] if @board[1] == @board[4] && @board[4] == @board[7]
    return @board[2] if @board[2] == @board[5] && @board[5] == @board[8]

    # Diagonals
    return @board[0] if @board[0] == @board[4] && @board[4] == @board[8]
    return @board[2] if @board[2] == @board[4] && @board[4] == @board[6]
  end

  def draw?
    @board.all? { |cell| cell =~ /^[XO]$/ }
  end
end
