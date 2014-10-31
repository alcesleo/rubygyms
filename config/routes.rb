Rails.application.routes.draw do
  root 'login#new'
  resources :login
end
