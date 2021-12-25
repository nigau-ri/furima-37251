Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments
  end
end
