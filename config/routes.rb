Rails.application.routes.draw do
  devise_for :users
  root 'artists#index'
  resources :artists
  resources :tickets do 
    resources :comments
  end
  resources :users, only: :show do
    member do
      get 'posts'
      get 'comment'
      get 'message'
    end
  end
  resources :lives do
    collection do
      get 'search'
    end
  end
end
