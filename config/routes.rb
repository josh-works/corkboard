Rails.application.routes.draw do

  root 'home#index'

  namespace :profile do
    get '/dashboard', to: 'dashboard#show'
  end

  get 'choose-account', as: 'choose_account', to: 'choose_account#index'
  get '/auth/facebook', as: 'facebook_login'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/pro/dashboard', to: 'pro#show'
  get '/twilio-confirmation', to:'twilio_confirmation#new'
  post 'twilio-confirmation', to: 'twilio_confirmation#create'

  resources :pro, only: [:new, :create]

  namespace :pro_register do
    resources :industry, path: 'industries', only: [:index]
    resources :industry, path: '', only: [:show] do
      resources :category, path: '', only: [:show]
    end
  end

  namespace :hire do
    resources :project, path: ':service', only: [:new, :create]
    resources :industry, path: '', only: [:show] do
      resources :category, path: '', only: [:show]
    end
  end

end
