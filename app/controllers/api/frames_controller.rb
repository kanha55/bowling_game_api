module Api
  class FramesController < ApplicationController
    before_action :set_frame, only: [:roll]

    # POST /api/frames/:id/roll
    def roll
      @roll = @frame.rolls.create!(pins: params[:pins])
      render json: @roll, status: :created
    end

    private

    def set_frame
      @frame = Frame.find(params[:id])
    end
  end
end