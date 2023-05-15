Rails.application.routes.draw do
  devise_for :users
  root to: "exhibits#index"
  resources :exhibits do
    resources :purchase, only: [:index, :new, :create]
  end
end