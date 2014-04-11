Jogarforca::Application.routes.draw do
  resources :games do
    member do
      patch 'guess'
    end
  end
end
