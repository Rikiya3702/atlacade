Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: "home#about"
  get 'result', to: "home#result"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :shops
  resources :machines
  resources :shop_machines

  get "/shop_machines/:id/new", to: 'shop_machines#new'
  get "/shop_machines/:id/edit", to: 'shop_machines#edit'
  post "/shop_machines/:id/create", to: 'shop_machines#create'
  patch "/shop_machines/:id/update", to: 'shop_machines#update'

end
