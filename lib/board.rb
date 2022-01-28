# frozen_string_literal: true

# Implpement the Game board
class Board
  attr_accessor :board

  def initialize
    @board = ('1'..'9').to_a
  end

  protected

  def print_board
    puts " #{@board[0..2].join(' | ')} "
    puts '-' * 11
    puts " #{@board[3..5].join(' | ')} "
    puts '-' * 11
    puts " #{@board[6..8].join(' | ')} "
  end
end
