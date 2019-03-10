Rails.application.routes.draw do
  root to: 'static#index'
  get :register, to: 'register_users#new'
  post :register, to: 'register_users#create'
  get :login, to: 'authenticate#new'
  post :login, to: 'authenticate#create'
  get :logout, to: 'authenticate#destroy'

  resources :tweets, only: [:new, :create]

  namespace :ajax do
    resources :tweets, only: [:index]
  end
end
