Rails.application.routes.draw do

  permit_periods = -> (field){ Hash(
    constraints: { field => /[^\/]+(?=\.json\z)|[^\/]+/ }
  ) }

  post '/login'  => 'sessions#create'

  get    '/grunts'                    => 'grunts#index'
  post   '/user/:username/grunt'      => 'grunts#create',
                                         **permit_periods.(:username)
  get    '/user/:username/grunts'     => 'grunts#show',
                                         **permit_periods.(:username)
  get    '/user/:username/grunt/:id'  => 'grunts#show',
                                         **permit_periods.(:username)
  delete '/user/:username/grunt/:id'  => 'grunts#destroy',
                                         **permit_periods.(:username)

  get 'users'              => 'users#index'
  post '/user'             => 'users#create'
  get '/user/:username'    => 'users#show',
                              **permit_periods.(:username)
  patch '/user/:username'  => 'users#update',
                              **permit_periods.(:username)
  delete '/user/:username' => 'users#destroy',
                              **permit_periods.(:username)

end
