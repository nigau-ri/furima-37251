Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show] do
    resources :cards
  end
  
  root 'home#top'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments
  end
end
