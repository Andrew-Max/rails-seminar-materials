Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:show, :create, :new]

  resources :messages, only: [:create]

  resources :sessions, only: [:create, :new]
  get 'logout' => 'sessions#destroy'
end
