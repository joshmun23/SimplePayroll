Rails.application.routes.draw do
  resources :employees do
    resources :paychecks
  end

  resources :paychecks

  root 'employees#index'
  
end
