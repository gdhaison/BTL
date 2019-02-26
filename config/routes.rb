Rails.application.routes.draw do
  get 'laptop/new'
  get 'sessions/new'
  get 'users/new'
  get "static_pages/home"
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup",to: "users#create"
  get "/edit",to: "users#edit"
  get "/admin", to: "admin#admin"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  resources :users
  resources :laptops
end
