Rails.application.routes.draw do

  root 'subs#index'

  resources :users
  resources :subs
  resources :posts
  resource :session
end
