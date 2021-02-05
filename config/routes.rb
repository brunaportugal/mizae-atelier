Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'pages#home'

  resources :products, only: [:index, :show]
  resources :categories, only: [:index]
  resources :purchases, only: [:index]
end
