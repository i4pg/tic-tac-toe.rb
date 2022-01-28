# frozen_string_literal: true

require 'tac'

RSpec.describe Game do
  subject { described_class.new }
  let(:player) { subject.instance_variable_get(:@player) }
  let(:board) { subject.instance_variable_get(:@board) }
  describe '#check_input' do
    context 'check and verify user input' do
      it 'returns the input when enter a valid cell input' do
        expect(subject.check_input('2')).to eq('2')
      end
      describe '#correct_number?' do
        it 'returns nil when enter invalid input' do
          expect(subject.check_input('a')).to be_falsey
        end
      end
      describe '#duplicate?' do
        it 'returns nil when enter an assigned input' do
          board[1] = 'O'
          expect(subject.check_input('2')).to be_falsey
        end
      end
    end
  end
  describe '#assign' do
    context 'assign the player sign to the desired cell' do
      it 'assign "O" when the player sign is "O"' do
        cell = 5
        subject.assign(cell)
        expect(board[cell - 1]).to eq(player)
      end
    end
  end
  describe '#switch_player' do
    context 'switch between X and O' do
      it 'returns X when player is O' do
        expect { subject.switch_player }.to change { subject.instance_variable_get(:@player) }.from('O').to('X')
      end
    end
  end
  describe '#game_over?' do
    context 'to check wether the game finished or not' do
      it 'retunrs nil when the game still did not finish' do
        expect(subject.game_over?).to be_nil
      end
      it 'returns the "X" when x win' do
        board[0] = 'X'
        board[1] = 'X'
        board[2] = 'X'
        expect(subject.game_over?).to eq('Player X Won!')
      end
      it 'returns draw when the board is full' do
        board[0] = 'X'
        board[1] = 'O'
        board[2] = 'X'
        board[3] = 'O'
        board[4] = 'X'
        board[5] = 'O'
        board[6] = 'O'
        board[7] = 'X'
        board[8] = 'O'
        expect(subject.game_over?).to eq('it is a draw')
      end
    end
  end
end
