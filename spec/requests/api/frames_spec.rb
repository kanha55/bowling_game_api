require 'rails_helper'

RSpec.describe Api::FramesController, type: :controller do
  let(:game) { Game.create! }
  let(:frame) { game.frames.first }

  describe 'POST #roll' do
    let(:valid_attributes) { { pins: 5 } }

    context 'with valid params' do
      it 'creates a new roll' do
        expect {
          post :roll, params: { id: frame.id, **valid_attributes }
        }.to change(Roll, :count).by(1)
      end

      it 'returns a created status' do
        post :roll, params: { id: frame.id, **valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end
  end
end