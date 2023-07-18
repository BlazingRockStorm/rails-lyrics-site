# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :songs, only: [:index, :show]
  resources :genres, only: [:index, :show]
  root 'songs#index'

  namespace :admin do
    resources :artists
    resources :genres
    resources :songs
  end

  match '*unmatched', to: 'application#not_found', via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
