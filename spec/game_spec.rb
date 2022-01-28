# frozen_string_literal: true

require 'game'

RSpec.describe Game do
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
  before do
    expect(subject).to receive(:puts).with("Player #{current_player}, your turn: ")
    expect(subject).to receive(:gets).and_return("5\n")
    expect(subject).to receive(:puts).with('Please, type a number between 1 to 9!')
    subject.take_input
  end
  describe '#take_input' do
    context 'ask user to enter a cell number' do
      it 'return assigned cell when enter valid number' do
        expect(board[4]).to eq(player_one)
      end
    end
  end
  describe '#correct_number?' do
    context 'check wether the input is between 1~9 or not' do
      it 'retunrs the input when it is valid number' do
        expect(subject.correct_number?(5)).to eq(5)
      end
      it 'returns nil when input is invalid' do
        expect(subject).to receive(:puts).with('invalid input!')
        expect(subject.correct_number?('A')).to be_nil
      end
    end
  end
  describe '#duplicate?' do
    context 'check wether the cell is empty or not' do
      it 'returns assigned cell when it is empty' do
        expect(subject.duplicate?(4)).to eq(4)
      end
      it 'returns nil when cell is already assigned' do
        expect(subject).to receive(:puts).with('This cell is filled, Please try another cell')
        expect(subject.duplicate?(5)).to be_nil
      end
    end
  end
end
