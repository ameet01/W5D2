Rails.application.routes.draw do

  resources :users
  resources :subs
  resources :posts do
    resources :comments, only: [:new]
  end
  resources :comments
  resource :session
end
