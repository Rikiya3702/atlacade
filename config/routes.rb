Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: "home#about"
  get 'result', to: "home#result"
  # get 'shop', to: "home#shop"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :shops
  # get 'shops/index' => 'shops#index'
  # get 'shops/show/:id' => 'shops#show'
  # get 'shops/new' => 'shops#new'
  # post 'shops/create' => 'shops#create'
end
