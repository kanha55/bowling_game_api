module Api
  class GamesController < ApplicationController
    before_action :set_game, only: [:roll, :score]

    # POST /api/games
    def create
      @game = Game.create!

      # Render the created game as JSON, including its frames
      render json: @game.as_json(include: :frames), status: :created
    end

    # GET /api/games/:id/score
    def score
      
      # Render the game's total score and each frame's id and score as JSON 
      render json: { 
        total_score: @game.score, 
        frames: @game.frames.as_json(only: [:id, :score]) 
      }, status: :ok
    end

    private

    def set_game
      @game = Game.find(params[:id])
    end
  end
end