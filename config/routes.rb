Rails.application.routes.draw do
  root 'home#index'

  resources :users, except: [:destroy, :edit, :update]

  resources :messages, only: [:index, :create]

  resources :sessions, only: [:create, :new]
  get 'logout' => 'sessions#destroy'
end
