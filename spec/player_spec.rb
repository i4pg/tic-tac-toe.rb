# frozen_string_literal: true

require 'player'

RSpec.describe Player do
  subject { described_class.new }
  let(:player_one) { subject.instance_variable_get(:@player_one) }
  let(:player_two) { subject.instance_variable_get(:@player_two) }
  let(:current_player) { subject.instance_variable_get(:@current_player) }
  describe '#choose_player' do
    context 'ask user to choose X or O' do
      it 'returns player one => O, when choose 1' do
        expect(subject).to receive(:puts).with("Enter a number\n 1 => O\n 2 => X")
        expect(subject).to receive(:gets).and_return("1\n")
        subject.choose_player
        expect(current_player).to eq(player_one)
      end
      it 'returns player two => X, when choose 2' do
        expect(subject).to receive(:puts).with("Enter a number\n 1 => O\n 2 => X")
        expect(subject).to receive(:gets).and_return("2\n")
        subject.choose_player
        expect(current_player).to eq(player_two)
      end
      context 'when enter invalid choise one then valid choise' do
        it 'ask again then take the right input' do
          expect(subject).to receive(:puts).with("Enter a number\n 1 => O\n 2 => X").twice
          expect(subject).to receive(:gets).and_return("3\n", "2\n")
          subject.choose_player
          expect(current_player).to eq(player_two)
        end
      end
    end
  end
  describe '#switch_player' do
    context 'switch between rounds' do
      before do
        allow(subject).to receive(:puts).with("Enter a number\n 1 => O\n 2 => X")
        allow(subject).to receive(:gets).and_return("1\n")
        subject.choose_player
      end
      it 'retunrs player_two when current_player is player_one' do
        subject.switch_player
        expect(current_player).to eq(player_two)
      end
    end
  end
end
