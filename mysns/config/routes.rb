Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    member do
      get :following, :followers
    end
    resources :notifications, only: [:index]
  end

  resources :relationships, only: [:create, :destroy]

  resources :tweets do
    resources :replies do
      resources :reply_favs, only: [:create, :destroy]
    end
    resources :tweet_favs, only: [:create, :destroy]
  end

  root 'tweets#index'
end
