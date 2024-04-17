class Roll < ApplicationRecord
  belongs_to :frame

  # Validate that pins is present, is an integer, and is between 0 and 10
  validates :pins, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  # Validate the maximum number of rolls per frame
  validate :maximum_rolls_per_frame

  private
  
  # Add an error if a frame already has the maximum number of rolls
  def maximum_rolls_per_frame
    if frame.strike? || frame.spare?
      errors.add(:base, "Maximum three rolls allowed per frame") if frame.rolls.count >= 3 
    else
      errors.add(:base, "Maximum two rolls allowed per frame") if frame.rolls.count >= 2
    end
  end
end
