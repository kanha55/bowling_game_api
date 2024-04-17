class Game < ApplicationRecord
  has_many :frames, dependent: :destroy
  has_many :rolls, through: :frames

  after_create :create_frames

  def score
    frames.map(&:score).sum
  end


  private

  def create_frames
    10.times { frames.create! }
  end
end
