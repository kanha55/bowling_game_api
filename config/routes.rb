Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  namespace :api do
    resources :games, only: [:create] do
      member do
        post :roll
        get :score
      end
    end
    resources :frames, only: [] do
      member do
        post :roll
      end
    end
  end
end
