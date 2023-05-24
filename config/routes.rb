Rails.application.routes.draw do
  devise_for :users
  root to: "exhibits#index"
  resources :exhibits do
    resources :purchases, only: [:index, :create]
  end
  resources :users, only: :show
end