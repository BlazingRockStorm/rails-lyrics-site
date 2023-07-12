# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :songs, only: [:index, :show]

  namespace :admin do
    resources :genres
    resources :songs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
