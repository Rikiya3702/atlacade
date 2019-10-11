Rails.application.routes.draw do

  devise_for :users

  root 'home#index'
  get 'about', to: "home#about"
  get 'result', to: "home#result"
  get 'shop', to: "home#shop"

end
