Rails.application.routes.draw do
  resources :select_employees

  resources :employees do
    resources :paychecks
  end

  resources :paychecks

  root 'employees#index'

end
