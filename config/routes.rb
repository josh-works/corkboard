Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  resources :bid, only: [:create]
  resources :bids
  resources :messages

  root 'home#index'

  get '/dashboard', to: 'users#show'

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
  get '/hire/new-project-confirmation/:id', to: 'hire/project#confirmation', as: 'new_project_confirmation'

  resources :pro, only: [:new, :create]

  namespace :pro_dashboard do
    resources :open_projects, only: [:index, :show]
    resources :project_bids, only: [:index]
  end

  namespace :pro_register do
    resources :industry, path: 'industries', only: [:index]
    resources :industry, path: '', only: [:show] do
      resources :category, path: '', only: [:show]
    end
  end

  namespace :hire do
    resources :project, path: ':service', only: [:new, :create, :update]
    resources :project, only: [:show]
    resources :industry, path: '', only: [:show] do
      resources :category, path: '', only: [:show]
    end
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :autocomplete, only: [:index]
    end
  end
end
