Rails.application.routes.draw do
  # get 'homes/index'
  # get 'homes/show'
  get 'home/top'
  get 'home/about'

  root :to => 'home#top'
  devise_for :users
  resources :books
  resources :profile_images
  resources :users
end