Rails.application.routes.draw do

  root 'static#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  #devise_scope :user do
  #  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #nd

  # static_controller
  get 'badges', to: 'static#badges'

  # user scope method urls
  get '/users/:id/favorites', to: 'users#favorites'
  get '/users/:id/tasted', to: 'users#tasted'

  resources :teas, only: [:index, :show] #view all teas, or single tea profile
  resources :benefits
  resources :ingredients

end
