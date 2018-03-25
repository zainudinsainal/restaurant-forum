Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :followships, only: [:create, :destroy]

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    collection do
      get :feeds
      get :ranking
    end
    member do
      post :favorite
      post :unfavorite
    end
  end

  resources :categories, only: :show
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

end
