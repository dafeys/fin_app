Rails.application.routes.draw do
  get 'main/index'
  resources :operations
  resources :categories
  root "main#index"
end
