Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"
  resources :home, only: [:index]
  resources :products, only: [:show]
  resources :tasks, only: [:create, :destroy]
  resources :projects do
    resources :posts, only: [:create, :destroy]
    resources :tasks, only: [:create, :destroy]
  end
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
end
