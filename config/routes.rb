Rails.application.routes.draw do
  # Movies routes
  resources :movies do
    resources :reviews
  end

  # Reviews routes
  resources :reviews, only: [:index, :show, :edit, :new, :create, :update, :destroy]

  # Users routes
  resources :users, only: [:index, :show, :edit, :update, :destroy]


  # Sessions routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Registration routes
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  # Home route
  root 'movies#index'
end
