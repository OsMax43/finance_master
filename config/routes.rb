Rails.application.routes.draw do
  # get '/categoties', to: 'categories#index'
  # get '/categories/new', to: 'categories#new'
  # post '/categories/new', to: 'categories#create'
  resources :categories
  resources :operations

  
  get '/reports', to: 'reports#index'
  get '/reports/report_by_category', to: 'reports#report_by_category'
  get '/reports/report_by_dates', to: 'reports#report_by_dates'
  
  root "pages#index"


end
