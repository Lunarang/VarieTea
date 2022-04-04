Rails.application.routes.draw do
  
  devise_for :users
  root 'static#home'

  # Third party authorization
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  # static_controller
  get 'badges', to: 'static#badges'

  # user scope method urls
  get '/users/:id/favorites', to: 'users#favorites'
  get '/users/:id/tasted', to: 'users#tasted'

  resources :teas, only: [:index, :show] #view all teas, or single tea profile
  resources :benefits
  resources :ingredients
  
end
