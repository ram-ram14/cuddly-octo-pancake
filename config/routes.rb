Rails.application.routes.draw do
  # Movies routes
  resources :movies do
    resources :reviews, only: [:new, :create, :index]
    get 'add_review', on: :member
  end

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
