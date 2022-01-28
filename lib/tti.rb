# frozen_string_literal: true

# A tic-tac-toe game on the command line where two human players can play
# against each other and the board is displayed in between turns
module TicTacToe
  # play game
  class Game
    def initialize
      @board = ('1'..'9').to_a
      @player = 'O'
      @winner = nil
      game_loop
    end

    # Tic Tac Toe Broad
    def display_board
      puts " #{@board[0..2].join(' | ')} "
      puts '-' * 11
      puts " #{@board[3..5].join(' | ')} "
      puts '-' * 11
      puts " #{@board[6..8].join(' | ')} "
    end

    def gets_match
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

      nil
    end

    def disply_board
      display_board
    end

    def get_user_input
      puts "Player #{@player}, your turn: "
      puts 'Please, type a number between 1 to 9!'
      gets.chomp.to_i
    end

    def check_input(input)
      input -= 1
      if @board[input] =~ /^[XO]$/
        puts 'This cell is already filled, Please try another cell.'
      end # input =~ /^\d$/

      input
    end

    def player_turn(input)
      @board[input] = @player
    end

    def check_board_state
      return 'win' if @winner
      return 'full' if board_full?

      @winner = gets_match
    end

    def switch_player
      @player = @player == 'O' ? 'X' : 'O'
    end

    def board_full?
      @board.all? { |cell| cell =~ /^[XO]$/ }
    end

    def draw_or_winner
      if @winner.nil?
        puts "It's a draw..."
      else
        puts "Player '#{@winner}' Won!"
      end
    end

    def game_loop
      loop do
        return draw_or_winner if @winner

        get_input = get_user_input
        input = check_input(get_input)
        player_turn(input)
        check_board_state
        switch_player
        display_board
      end
    end
  end
end

a = TicTacToe::Game.new
