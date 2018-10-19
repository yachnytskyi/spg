require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'

  resources :categories
  resources :topics
  
end
