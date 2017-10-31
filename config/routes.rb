Rails.application.routes.draw do
  root 'subs#index'
  resources :users
  resources :subs
  resources :posts do
    resources :comments, only: [:new]
  end
  resources :comments
  resource :session
end
