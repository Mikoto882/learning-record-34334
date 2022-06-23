Rails.application.routes.draw do
  devise_for :users
  root to: "learns#index"
  resources :learns do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
