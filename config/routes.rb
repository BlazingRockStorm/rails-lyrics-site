# frozen_string_literal: true
require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  devise_for :users
  resources :songs, only: [:index, :show]
  resources :albums, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :artists, only: [:index, :show]

  namespace :admin do
    resources :artists
    resources :genres
    resources :albums
    resources :songs
  end

  get '/search_results', to: 'home#search_results', as: 'search_results'
  get '/about', to: 'home#about', as: 'about'
  get '/', to: 'home#index', as: 'home'

  authenticate :user do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  root 'home#index'
  match '*unmatched', to: 'application#not_found', via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
