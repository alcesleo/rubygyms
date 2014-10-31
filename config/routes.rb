Rails.application.routes.draw do
  root 'sessions#new'

  # TODO: specify the routes so we don't have the unnecessary ones
  resources :sessions
  get "log_out" => "sessions#log_out"
  resources :users
end
