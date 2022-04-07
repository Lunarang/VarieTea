Rails.application.routes.draw do

  root 'static#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # nested 
  resource :user, only: [:show] do
    resources :badges, only: [:index] #view index only for user
    resources :teas, only: [:new, :create, :edit, :update] #new/create & edit/update options for user submitted data
  end

  # static_controller
  get 'badges', to: 'static#badges'

  # tea scope method url
  get '/teas/newest', to: 'teas#newest'
 
  resources :teas, only: [:index, :show] #view all teas, or single tea profile
  resources :benefits
  resources :ingredients

end
