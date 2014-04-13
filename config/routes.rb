Jogarforca::Application.routes.draw do
  resources :games, except: [:edit, :destroy]
end
