Rails.application.routes.draw do
  resources :movies
  resources :people
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
