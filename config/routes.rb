Rails.application.routes.draw do
  root to: "welcome#index"
  get "/", to: "welcome#index"
  devise_for :users
  resources :users 

  resources :listings
  
end
