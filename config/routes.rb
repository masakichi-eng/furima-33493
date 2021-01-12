Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: 'items#index'

  resources :items, only: [:show, :create, :new, :edit, :update,:destroy]
end
