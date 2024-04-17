class Frame < ApplicationRecord
  belongs_to :game

  # Each frame has many rolls, and if a frame is destroyed, its associated rolls will also be destroyed
  has_many :rolls, dependent: :destroy

  # Validate that a game can have a maximum of ten frames
  validate :maximum_ten_frame_per_game, on: :create

  # Calculate the score of a frame by summing the pins knocked down in its rolls
  def score
    rolls.map(&:pins).sum
  end

  # Check if the frame was a strike (i.e., all ten pins were knocked down in the first roll)
  def strike?
    rolls.first&.pins == 10
  end   
  
  # Check if the frame was a spare (i.e., all ten pins were knocked down in two rolls)
  def spare?  
    rolls.sum(:pins) == 10
  end

  private 

  # Add an error if a game already has ten frames
  def maximum_ten_frame_per_game
    errors.add(:base, "Maximum ten frames allowed per game") if game.frames.count >= 10
  end
end
