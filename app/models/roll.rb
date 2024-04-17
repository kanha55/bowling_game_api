class Roll < ApplicationRecord
  belongs_to :frame
  validates :pins, presence: true
  validates :pins, numericality: { only_integer: true }
  validates :pins, numericality: { greater_than_or_equal_to: 0 }
  validates :pins, numericality: { less_than_or_equal_to: 10 }
  validate :maximum_two_rolls_per_frame

  def self.create_rolls(frame, pins)
    frame.rolls.create(pins: pins)
    frame.update(score: frame.score + pins)
  end

  private

  def maximum_two_rolls_per_frame
    if frame.strike? || frame.spare?
      errors.add(:base, "Maximum four rolls allowed per frame") if frame.rolls.count >= 3 
    else
      errors.add(:base, "Maximum two rolls allowed per frame") if frame.rolls.count >= 2
    end
  end
end
