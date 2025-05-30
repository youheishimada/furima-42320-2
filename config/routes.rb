Rails.application.routes.draw do
  root to: 'items#index'

  devise_for :users

  resources :items do
    resources :orders, only: [:index, :create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end