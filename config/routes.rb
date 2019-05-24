Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :camels do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
