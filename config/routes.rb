Rails.application.routes.draw do

  get '/users/', to: "users#index", as: 'users'
  get '/users/:id', to: "users#show", as: 'user'

  get '/users/:id/favorites/new', to: "favorites#new", as: 'new_user_favorite'
  post '/users/:id/favorites', to: "favorites#create"

  get '/users/:id/palettes/new', to: "palettes#new", as: 'new_user_palette'
  post '/users/:id/palettes', to: "palettes#create"

  get '/colors', to: "colors#index", as: 'colors'
  get '/colors/:id', to: "colors#show", as: 'color'

end
