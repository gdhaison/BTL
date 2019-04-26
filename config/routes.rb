Rails.application.routes.draw do
  get 'laptops/new'
  get "static_pages/home"
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  post "/signup",to: "users#create"
  get "/edit",to: "users#edit"
  get "/admin", to: "admin#index"
  get '/login', to: 'sessions#new'
  get "list_dell", to: "laptops#list_dell"
  get "list_asus", to: "laptops#list_asus"
  get "list_msi", to: "laptops#list_msi"
  post '/login', to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  get "/addlaptop", to: "laptops#new"
  post "/addlaptop", to: "laptops#create"
  resources :users
  resources :laptops
  resources :account_activations, only: [:edit]
  resources :carts
  resources :cart_items

  namespace :admin do
    resources :users
    resources :laptops
    resources :microposts
  end
end
