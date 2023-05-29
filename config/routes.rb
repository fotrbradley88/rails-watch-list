Rails.application.routes.draw do
  resources :films
  get 'custom_lists/index'

  root 'lists#index'

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
    resources :movies, only: [:new, :create]  # Nested resource for creating movies under a list
  end

  resources :bookmarks, only: [:destroy]
  resources :movies, only: [:destroy]  # Route for deleting movies

  get '/books', to: 'books#index'
  get '/movies', to: 'movies#index'
  get '/bookmarks', to: 'bookmarks#index'

  # Remove the duplicate root route
  # root 'pages#home'  # Set the root path to the home page
end
