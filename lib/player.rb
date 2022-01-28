# frozen_string_literal: true

require_relative 'board'
# Implement the game
class Player < Board
  attr_accessor :current_player

  def initialize
    super
    @player_one = 'O'
    @player_two = 'X'
    @current_player = nil
  end

  def choose_player
    puts "Enter a number\n 1 => O\n 2 => X"
    input = gets.chomp
    case input
    when '1'
      @current_player = @player_one
    when '2'
      @current_player = @player_two
    else
      choose_player
    end
  end

  def switch_player
    @current_player = @current_player == @player_one ? @player_two : @player_one unless @current_player.nil?
  end

  private

  attr_reader :player_one, :player_two
end
