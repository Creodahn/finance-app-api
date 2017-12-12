Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    jsonapi_resources :accounts
    jsonapi_resources :account_types
    jsonapi_resources :addresses
    jsonapi_resources :audits
    jsonapi_resources :contact_info_types
    jsonapi_resources :groups
    jsonapi_resources :images
    jsonapi_resources :memberships
    jsonapi_resources :phone_numbers
    jsonapi_resources :profiles
    jsonapi_resources :rights
    jsonapi_resources :roles
    jsonapi_resources :transactions
    jsonapi_resources :transaction_types
    jsonapi_resources :users
  end

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'api/accounts', to: 'accounts#show'
  post 'api/users', to: 'users#create'
end
