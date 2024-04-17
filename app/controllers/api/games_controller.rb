module Api
  class GamesController < ApplicationController
    before_action :set_game, only: [:roll, :score]

    # POST /api/games
    def create
      @game = Game.create!
      render json: @game.as_json(include: :frames), status: :created
    end

    # GET /api/games/:id/score
    def score
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