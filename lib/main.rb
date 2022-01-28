# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'
require_relative 'winning'

# implement game loop
class GameLoop < Winning
  def initialize
    super
    choose_player
    game_loop
  end

  def game_loop
    return winner if game_over?

    take_input
    print_board
    game_over?
    switch_player
    game_loop
  end

  def winner
    case game_over?
    when @player_one
      p 'O won!'
    when @player_two
      p 'X won!'
    when 'it is a draw!'
      p 'it is a draw!'
    end
  end
end

GameLoop.new
