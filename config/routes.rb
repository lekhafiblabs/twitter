# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  get 'users/profile/:id' => 'users#profile'
  resources :users
  resources :tweets
  post 'follows/follow/:id' => 'follows#follow'
  post 'follows/unfollow/:id' => 'follows#unfollow'
end
