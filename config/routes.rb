Rails.application.routes.draw do
  root "users#index"

  resources :users, only: %i[new create index show edit update]
end
