Rails.application.routes.draw do
  devise_for :users
  root to: "learns#index"
  resources :learns do
    resources :comments, only: :create
  end
  resources :users, only: :show do
    resources :profiles, only: [:edit, :update]
  end
end
