Rails.application.routes.draw do
  # Movies routes (added the routes for the movies resource)
  resources :movies do
  resources :reviews, only: [:new, :create, :index]
  get 'add_review', on: :member
  end

  # Users routes (added routes for users resource)
  resources :users, :only => [:index, :new, :create]

  # Sessions routes (added routes for sessions)
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'

  # Registration routes (added routes for registration)
  get '/register' => 'users#new'
  post '/register' => 'users#create'

  # Home route (added a route for the application)
  root 'movies#index'
end
