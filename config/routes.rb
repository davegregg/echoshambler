Rails.application.routes.draw do
  # resources :users, only: [:index]
  # resources :grunts

  post '/login'  => 'sessions#create'
  # options '/'    => 'options#index'

  root                                   'grunts#index'
  get    '/grunts'                    => 'grunts#index'
  post   '/users/:username/grunt'     => 'grunts#create'
  get    '/users/:username/grunts'    => 'grunts#show'
  get    '/users/:username/grunt/:id' => 'grunts#show'
  patch  '/users/:username/grunt/:id' => 'grunts#update'
  delete '/users/:username/grunt/:id' => 'grunts#delete'

  get 'users'              => 'users#index'
  post '/user'             => 'users#create'
  get '/user/:username'    => 'users#show'
  patch '/user/:username'  => 'users#update'
  delete '/user/:username' => 'users#destroy'

  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
end
