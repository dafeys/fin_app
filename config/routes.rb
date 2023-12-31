Rails.application.routes.draw do
  devise_for :users
  get 'reports/report'
  get 'reports/index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'main/index'
  resources :operations
  resources :categories
  root "main#index"
end
