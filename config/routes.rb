Rails.application.routes.draw do

  root 'static#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # nested 
  resources :users, only: [:show] do
    get 'teas', to: 'users#teas'
    resources :badges, only: [:index] #view index only for user
    resources :teas, only: [:new, :edit, :update] #new/create & edit/update options for user submitted data
    resources :benefits, only: [:new, :create, :edit, :update]
    resources :ingredients, only: [:new, :create, :edit, :update]
  end

  resources :favorites, only: [:create, :destroy]
  
  # tea scope method url
  get '/teas/newest', to: 'teas#newest'
 
  resources :teas, only: [:index, :show, :create] #view all teas, or single tea profile
  resources :benefits, only: [:index, :show]
  resources :ingredients, only: [:index, :show]

end
