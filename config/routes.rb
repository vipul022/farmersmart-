Rails.application.routes.draw do
  root to: "welcome#index"
  get "/", to: "welcome#index"
  get "/payments/success", to: "payments#success"
  get "/payments/session", to: "payments#get_stripe_id"
  devise_for :users
  resources :users 
  resources :carts, only: [:create, :index, :destroy]

  
  resources :listings
  get "/search", to: "listings#search", as: "search"
  
end
 
