Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  get 'users/show'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
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
