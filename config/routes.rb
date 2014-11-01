Rails.application.routes.draw do
  root 'sessions#index'

  get "log_in" => "sessions#new"
  post "log_in" => "sessions#log_in"
  get "log_out" => "sessions#log_out"

  # TODO: specify the routes so we don't have the unnecessary ones
  resources :users
end
