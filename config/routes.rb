Rails.application.routes.draw do

  get 'users/', to: "users#index", as: 'users'
  get 'users/:id', to: "users#show", as: 'user'

  get 'users/:id/palettes/new', to: "palettes#new", as: 'new_user_palette'
  get 'users/:id/favorites/new', to: "favorites#new", as: 'new_user_favorite'

  get 'colors/:id', to: "colors#show", as: 'color'



end
