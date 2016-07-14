Rails.application.routes.draw do
  resources :users
  resources :tweets
  root 'users#index'
end
