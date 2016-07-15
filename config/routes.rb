Rails.application.routes.draw do
  resources :users
  resources :tweets
  root 'dashboard#index'
end
