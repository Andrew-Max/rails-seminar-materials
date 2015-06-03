Rails.application.routes.draw do

# only index and show
  root 'home#index'

  resources :users, except: [:destroy, :edit, :update]

  resources :messages, only: [:index, :create]

  resources :sessions, only: [:create, :new]
  get 'logout' => 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"



end
