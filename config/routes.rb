Rails.application.routes.draw do
  devise_for :users
  root to: "learns#index"
  resources :learns
end
