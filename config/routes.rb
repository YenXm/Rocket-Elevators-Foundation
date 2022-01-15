# frozen_string_literal: true

Rails.application.routes.draw do
  get 'interventions/create'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get '/media_player', to: 'home#media_player'
  get '/residential', to: 'home#residential'
  get '/commercial', to: 'home#commercial'
  get '/quote', to: 'home#quote'
  get '/index', to: 'home#index'
  post '/create_quotes' => 'quotes#create'
  post '/create_leads' => 'leads#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit', as: :user
  patch '/users/:id/edit' => 'users#update'

  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'

  # get '/audio', to: 'admin/dashboard#file'

  get 'admin/ibm_call' => 'admin/dashboard#ibm_call'
  get '/ibm_call' => 'admin/dashboard#ibm_call'

  # get '/get_collection' => 'admin/collection'
  get '/collection' => 'interventions#collection'

  # Exchange rate api
  get '/exchange_rate' => 'admin/exchange_rate#get_exchange_rates'
  get '/symbol' => 'admin/exchange_rate#symbol'

  # Covid stats api
  get '/covid_stats' => 'admin/covid_stats#get_covid_stats'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
