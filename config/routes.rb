Rails.application.routes.draw do
  resources :employees

  resources :paychecks
  root 'employees#index'
  get 'employees/:id/paychecks/new', to: 'paychecks#new'

end
