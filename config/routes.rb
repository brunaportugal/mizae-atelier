Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'pages#home'

  resources :products, only: [:index, :show]
  resources :collections, only: [:index, :show]
  resources :purchases, only: [:index]

  namespace :admin do
    root to: 'pages#home'
    resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :collections, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end
