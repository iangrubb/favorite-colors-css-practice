Rails.application.routes.draw do

  get '/users/', to: "users#index", as: 'users'
  get '/users/:id', to: "users#show", as: 'user'

  get '/users/:id/favorites/new', to: "favorites#new", as: 'new_user_favorite'
  get '/users/:id/palettes/new', to: "palettes#new", as: 'new_user_palette'
  

  get '/colors', to: "colors#index", as: 'colors'
  get '/colors/:id', to: "colors#show", as: 'color'



end
