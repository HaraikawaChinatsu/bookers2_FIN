Rails.application.routes.draw do
  get 'homes/index'
  get 'homes/show'
  get 'homes/top'
  get 'homes/about'
  # root 'post_images#index'
  root :to => 'homes#top'
  devise_for :users
  resources :books
  resources :profile_images do
  # resource :favorites, only: [:create, :destroy]
  # resources :post_comments, only: [:create, :destroy]
end
  resources :users, only: [:show, :edit, :update, :index]
end