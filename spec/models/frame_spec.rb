require 'rails_helper'

RSpec.describe Frame, type: :model do
  let(:game) { Game.create! }
  let(:frame) { game.frames.first }

  describe '#score' do
    it 'calculates the score of a frame' do
      frame.rolls.create!(pins: 5)
      frame.rolls.create!(pins: 4)
      expect(frame.score).to eq(9)
    end
  end

  describe '#strike?' do
    it 'returns true if the frame was a strike' do
      frame.rolls.create!(pins: 10)
      expect(frame.strike?).to be true
    end

    it 'returns false if the frame was not a strike' do
      frame.rolls.create!(pins: 5)
      expect(frame.strike?).to be false
    end
  end

  describe '#spare?' do
    it 'returns true if the frame was a spare' do
      frame.rolls.create!(pins: 5)
      frame.rolls.create!(pins: 5)
      expect(frame.spare?).to be true
    end

    it 'returns false if the frame was not a spare' do
      frame.rolls.create!(pins: 5)
      frame.rolls.create!(pins: 4)
      expect(frame.spare?).to be false
    end
  end

  describe 'validation' do
    it 'does not allow more than ten frames per game' do
      10.times { game.frames.create }
      extra_frame = game.frames.build
      expect(extra_frame).not_to be_valid
      expect(extra_frame.errors.full_messages).to include("Maximum ten frames allowed per game")
    end
  end
end