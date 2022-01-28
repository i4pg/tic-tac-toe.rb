# frozen_string_literal: true

require 'winning'

RSpec.describe Winning do
  before do
    allow(subject).to receive(:puts).with("Enter a number\n 1 => O\n 2 => X")
    allow(subject).to receive(:gets).and_return("1\n")
    subject.choose_player
  end
  subject { described_class.new }
  let(:player_one) { subject.instance_variable_get(:@player_one) }
  let(:player_two) { subject.instance_variable_get(:@player_two) }
  let(:current_player) { subject.instance_variable_get(:@current_player) }
  let(:board) { subject.instance_variable_get(:@board) }
  describe '#game_over?' do
    context 'when player_one won' do
      before do
        expect(subject).to receive(:puts).with("Player #{current_player}, your turn: ").exactly(3)
        expect(subject).to receive(:puts).with('Please, type a number between 1 to 9!').exactly(3)
        expect(subject).to receive(:gets).and_return("5\n", "1\n", "9\n")
        3.times { subject.take_input }
      end
      it 'returns player_one' do
        expect(subject.game_over?).to eq(player_one)
      end
    end
    context 'when the board is full' do
      it 'returns draw' do
        allow(subject).to receive(:draw?).and_return(true)
        expect(subject.game_over?).to eq('it is a draw!')
      end
    end
    context 'when the game did not finish yet' do
      it 'retunrs nil' do
        expect(subject.game_over?).to be_nil
      end
    end
  end
end
