Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"
  resources :products
  resources :tasks, only: [:create, :destroy]
  resources :posts, only: [:create, :destroy]
end
