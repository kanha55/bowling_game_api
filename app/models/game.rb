class Game < ApplicationRecord
  has_many :frames, dependent: :destroy
  has_many :rolls, through: :frames

  # After a game is created, create ten frames for it
  after_create :create_frames

  # Calculate the score of a game by summing the scores of its frames
  def score
    frames.map(&:score).sum
  end

  private

  # Create ten frames for a game
  def create_frames
    10.times { frames.create! }
  end
end