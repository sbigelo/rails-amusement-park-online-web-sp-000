Rails.application.routes.draw do
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users', to:'users#index', as: 'users'
  post '/users', to:'users#create'
  root 'static#home'
  get '/signin', to: 'session#new', as: 'signin'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/attractions', to: 'attractions#index', as: 'attractions'
end
