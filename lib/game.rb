# frozen_string_literal: false

require_relative 'board'
require_relative 'player'

# implement the game
class Game < Player
  def take_input
    loop do
      puts "Player #{@current_player}, your turn: "
      puts 'Please, type a number between 1 to 9!'
      input = gets.chomp
      return assign_input(input) if correct_number?(input) && duplicate?(input)
    end
  end

  def correct_number?(input)
    return input if input.to_s =~ /^\d$/

    puts 'invalid input!'
  end

  def duplicate?(input)
    return input unless @board[input.to_i - 1] =~ /^[XO]$/

    puts 'This cell is filled, Please try another cell'
  end

  private

  def assign_input(input)
    @board[input.to_i - 1] = @current_player
  end
end
