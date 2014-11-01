Rails.application.routes.draw do
  root 'sessions#index'

  get  "log_in"  => "sessions#new"
  post "log_in"  => "sessions#log_in"
  get  "log_out" => "sessions#log_out"

  # TODO: specify the routes so we don't have the unnecessary ones
  resources :users
  resources :clubs

  # TODO: I think there is a better way of doing this
  get "/clubs/:id/kick/:member_id" => "clubs#kick", as: "kick_member"
end
