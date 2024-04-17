class Frame < ApplicationRecord
  belongs_to :game
  has_many :rolls, dependent: :destroy
  validate :maximum_ten_frame_per_game

  def score
    rolls.map(&:pins).sum
  end

  def strike?
    rolls.first&.pins == 10
  end   
  
  def spare?  
    rolls.map(&:pins).sum == 10
  end

  private 

  def maximum_ten_frame_per_game
    errors.add(:base, "Maximum ten frames allowed per game") if game.frames.count >= 10
  end
end
