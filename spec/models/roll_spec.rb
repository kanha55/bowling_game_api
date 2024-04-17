require 'rails_helper'

RSpec.describe Roll, type: :model do
  let(:game) { Game.create! }
  let(:frame) { game.frames.first }

  describe 'validation' do
    it 'does not allow more than two rolls per frame' do
      frame.rolls.create!(pins: 5)
      frame.rolls.create!(pins: 4)
      extra_roll = frame.rolls.build(pins: 3)
      expect(extra_roll).not_to be_valid
      expect(extra_roll.errors.full_messages).to include("Maximum two rolls allowed per frame")
    end

    it 'does not allow more than three rolls per frame if the frame was a strike or a spare' do
      frame.rolls.create!(pins: 10)
      frame.rolls.create!(pins: 5)
      frame.rolls.create!(pins: 4)
      extra_roll = frame.rolls.build(pins: 3)
      expect(extra_roll).not_to be_valid
      expect(extra_roll.errors.full_messages).to include("Maximum three rolls allowed per frame")
    end

    it 'does not allow a pins value less than 0' do
      roll = frame.rolls.build(pins: -1)
      expect(roll).not_to be_valid
      expect(roll.errors.full_messages).to include("Pins must be greater than or equal to 0")
    end

    it 'does not allow a pins value greater than 10' do
      roll = frame.rolls.build(pins: 11)
      expect(roll).not_to be_valid
      expect(roll.errors.full_messages).to include("Pins must be less than or equal to 10")
    end
  end
end