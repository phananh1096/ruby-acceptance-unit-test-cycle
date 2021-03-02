Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get '/movies/find/:id', to: 'movies#find_similar', as: 'find_movies'
  get '/movies/new', to: 'movies#create'
end
