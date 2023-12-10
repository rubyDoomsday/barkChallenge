Rails.application.routes.draw do
  root "sessions#new"

  # Session routes
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # resources
  resources :users, only: %i[new create index show edit update]
end
