Rails.application.routes.draw do
  root to: 'items#index'

  devise_for :users

  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get :category_list
      get :status_list
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end