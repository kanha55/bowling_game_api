require 'rails_helper'

RSpec.describe Api::GamesController, type: :controller do
  describe 'POST #create' do
    it 'creates a new game' do
      expect {
        post :create
      }.to change(Game, :count).by(1)
    end

    it 'returns a created status' do
      post :create
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET #score' do
    let(:game) { Game.create! }

    it 'returns a success status' do
      get :score, params: { id: game.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns the correct score' do
      get :score, params: { id: game.id }
      expect(JSON.parse(response.body)['total_score']).to eq(game.score)
    end
  end
end