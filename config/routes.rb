Rails.application.routes.draw do
  devise_for :users
  root to: "learns#index"
  resources :learns do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update] do
    resources :profiles, only: [:new, :create, :edit, :update]
  end
end
