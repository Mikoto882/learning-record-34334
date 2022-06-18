Rails.application.routes.draw do
  devise_for :users
  root to: "learns#index"
  resources :learns do
    resources :comments
  end
  resources :users
end
