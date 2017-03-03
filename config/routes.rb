Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :grunts
  post '/login' => 'sessions#create'
  # options '/'   => 'options#index'

  get '/user/:username' => 'users#show'
  post '/user' => 'users#create'
  patch '/user/:username' => 'users#update'
  delete '/user/:username' => 'users#destroy'

  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
end
