# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  post '/auth/login', to: 'authentication#login'
  delete '/auth/logout', to: 'authentication#logout'
  get '/*a', to: 'application#not_found'
end
