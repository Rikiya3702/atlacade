Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: "home#about"
  get 'result', to: "home#result"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :shops
  resources :machines
  resources :shop_machines, only: [:create, :edit, :update, :destroy]
  get "/shop_machines/:id/new", to: 'shop_machines#new'
  # post "/shop_machines/:id/create", to: 'shop_machines#create'

  resources :events, only: [:edit, :create, :update, :destroy]
  get "/events/:id/new", to: 'events#new'



end
