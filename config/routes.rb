Rails.application.routes.draw do
  get 'dashboards/dashboard'
  # Read all
  # get 'cars', to: 'cars#index'
  # get '/cars/new', to: 'cars#new'
  # post '/cars', to: 'cars#create'

  # # Read one - The `show` route needs to be *after* `new` route.
  # get 'cars/:id', to: "cars#show", as: :car

  # get 'cars/:id/edit', to: "cars#edit"
  # patch 'cars/:id', to: 'cars#update'

  # delete "cars/:id", to: "cars#destroy"

  devise_for :users
  root to: "pages#home"
  get 'dashboards', to: 'dashboards#dashboard'
  resources :cars, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: %i[destroy]
end
