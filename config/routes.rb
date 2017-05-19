Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/facebook', as: 'facebook_login'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
end
