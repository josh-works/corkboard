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
  post '/pro_register', to: 'pro_register#create'
  delete '/logout', to: 'sessions#destroy'
  get '/pro_register/signup', to: 'pro_register#new'
  get '/pro/dashboard', to: 'pro#show'

  namespace :pro_register do
    resources :industry, path: '', only: [:index] do
      resources :category, path: '', only: [:index] do
        resources :service, path: '', only: [:index]
      end
    end
  end

  # namespace :hire do
  #   resources :service, path: '', only: [:show]
  # end

  resources :service, path: 'hire', only: [:show]
  resources :project, only: [:create]

  resources :industry, path: '', only: [:show] do
    resources :category, path: '', only: [:show]
  end

end
