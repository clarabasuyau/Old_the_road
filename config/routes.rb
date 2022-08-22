Rails.application.routes.draw do
  # Read all
  get 'cars', to: 'cars#index'

  get 'cars/new'

  # Read one - The `show` route needs to be *after* `new` route.
  get 'cars/:id', to: "cars#show", as: :car

  get 'cars/create'
  get 'cars/update'
  delete "cars/:id", to: "cars#destroy"
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/cars/new', to: 'cars#new'
  post '/cars', to: 'cars#create'
end
