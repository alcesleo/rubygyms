Rails.application.routes.draw do
  root 'sessions#new'

  # TODO: specify the routes so we don't have the unnecessary ones
  resources :sessions
  resources :users
end
