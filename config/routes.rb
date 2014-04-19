Jogarforca::Application.routes.draw do
  root 'games#new'
  get '/games' => 'games#new'
  resources :games, except: [:index, :edit, :destroy] do
    collection do
      post :machine
    end
  end
end
