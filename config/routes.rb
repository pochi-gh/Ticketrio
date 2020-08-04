Rails.application.routes.draw do
  devise_for :users
  root 'artists#index'
  resources :artists
end
