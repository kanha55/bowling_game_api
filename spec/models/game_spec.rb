require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#score' do
    let(:game) { Game.create! }

    it 'calculates the score of a game' do
      game.frames.each do |frame|
        frame.rolls.create!(pins: 5)
        frame.rolls.create!(pins: 4)
      end
      expect(game.score).to eq(90)
    end
  end

  describe '#create_frames' do
    it 'creates ten frames for a game' do
      game = Game.create!
      expect(game.frames.count).to eq(10)
    end
  end
end