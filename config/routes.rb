Rails.application.routes.draw do
  root to: "welcome#index"
  get "/", to: "welcome#index"
  devise_for :users
  resources :users 
  resources :carts, only: [:create, :index, :destroy]

  
  resources :listings
  get "/search", to: "listings#search", as: "search"
  
end
 
