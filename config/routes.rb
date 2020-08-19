Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :homes
  resources :artists
  resources :tickets do 
    resources :comments
  end

  resources :lives
end
