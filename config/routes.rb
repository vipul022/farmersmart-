Rails.application.routes.draw do
  # get 'carts/create'
  # get 'carts/index'
  root to: "welcome#index"
  get "/", to: "welcome#index"
  devise_for :users
  resources :users 
  resources :carts, only: [:create, :index, :destroy]

  resources :listings
  
end
