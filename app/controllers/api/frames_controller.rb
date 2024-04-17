module Api
  class FramesController < ApplicationController
    before_action :set_frame, only: [:roll]

    # POST /api/frames/:id/roll
    def roll
      @roll = @frame.rolls.create(roll_params)
      render json: @roll, status: :created
    end

    private

    def set_frame
      @frame = Frame.find(params[:id])
    end

    def roll_params
      params.permit(:pins)
    end
  end
end