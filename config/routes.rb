# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'

  namespace :admin do
    resources :genres
    resources :songs
  end

  namespace :api do
    resources :songs, only: %i[index show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
