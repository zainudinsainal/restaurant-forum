Rails.application.routes.draw do
  
  devise_for :users

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :categories, only: :show
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

end
