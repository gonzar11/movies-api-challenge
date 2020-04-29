Rails.application.routes.draw do
  namespace :api do
    resources :movies
    resources :people
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'
  end
end
