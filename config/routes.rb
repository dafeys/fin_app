Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'main/index'
  resources :operations
  resources :categories
  resources :reports
  root "main#index"
end
