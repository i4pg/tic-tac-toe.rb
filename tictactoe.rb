# frozen_string_literal: false

# global var
module TicTacToe
  @@board = ('1'..'9').to_a
  @@player = 'O'
  @@winner = nil
end

# main class
class Game
  include TicTacToe

  def self.display_board
    puts " #{@@board[0..2].join(' | ')} "
    puts '-' * 11
    puts " #{@@board[3..5].join(' | ')} "
    puts '-' * 11
    puts " #{@@board[6..8].join(' | ')} "
  end

  def self.board_full?
    @@board.all? { |cell| cell =~ /^[XO]$/ }
  end

  def self.switch_player
    @@player = @@player == 'O' ? 'X' : 'O'
  end

  def self.gets_match
    # Rows
    return @@board[0] if @@board[0] == @@board[1] && @@board[1] == @@board[2]
    return @@board[3] if @@board[3] == @@board[4] && @@board[4] == @@board[5]
    return @@board[6] if @@board[6] == @@board[7] && @@board[7] == @@board[8]

    # Columns
    return @@board[0] if @@board[0] == @@board[3] && @@board[3] == @@board[6]
    return @@board[1] if @@board[1] == @@board[4] && @@board[4] == @@board[7]
    return @@board[2] if @@board[2] == @@board[5] && @@board[5] == @@board[8]

    # Diagonals
    return @@board[0] if @@board[0] == @@board[4] && @@board[4] == @@board[8]
    return @@board[2] if @@board[2] == @@board[4] && @@board[4] == @@board[6]

    nil
  end

  loop do
    # display board
    display_board

    # Get user input
    input = nil
    loop do
      puts "Player #{@@player}, your turn: "
      input = gets
      if input =~ /^\d$/
        input = input.to_i - 1
        break unless @@board[input] =~ /^[XO]$/

        puts 'This cell is already filled, Please try another cell.'
      else
        puts 'Please, type a number between 1 to 9!'
      end
    end

    # Player turn
    @@board[input] = @@player

    # check board state
    @@winner = gets_match
    break if @@winner
    break if board_full?

    # Switch turn
    switch_player
  end
  display_board

  if @@winner.nil?
    puts "It's a draw..."
  else
    puts "Player '#{@@winner}' Won!"
  end
end
