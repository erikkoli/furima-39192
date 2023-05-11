Rails.application.routes.draw do
  devise_for :users
  root to: "exhibits#index"
  resources :exhibits, only: [:new, :create, :show, :edit, :update]
end