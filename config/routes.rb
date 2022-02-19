Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
  get 'rooms/posts', to: 'rooms#posts'
  get "/rooms/search" => "rooms#search", as: 'search'
  
  resources :users
  resources :rooms
  resources :reservations
  
  post 'reservations/confirm' 
end
