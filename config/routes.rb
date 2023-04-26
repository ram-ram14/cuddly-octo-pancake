Rails.application.routes.draw do
  # Movies routes
  resources :movies do
    resources :reviews
  end

  # Reviews routes
  resources :reviews, only: [:index, :show, :edit, :new, :create, :update, :destroy]

  # Users routes
  resources :users, :only => [:index, :new, :create]


  # Sessions routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'

  # Registration routes
  get '/register' => 'users#new'
  post '/register' => 'users#create'

  # Home route
  root 'movies#index'
end
