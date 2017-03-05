Rails.application.routes.draw do

  permit_periods = {constraints: {username: /[^\/]+(?=\.json\z)|[^\/]+/}}

  post   '/login'                     => 'sessions#create'

  get    '/grunts'                    => 'grunts#index'
  post   '/user/:username/grunt'      => 'grunts#create',
                                         **permit_periods
  get    '/user/:username/grunts'     => 'grunts#show',
                                         **permit_periods
  get    '/user/:username/grunt/:id'  => 'grunts#show',
                                         **permit_periods
  delete '/user/:username/grunt/:id'  => 'grunts#destroy',
                                         **permit_periods

  get    '/users'                     => 'users#index'
  post   '/user'                      => 'users#create'
  get    '/user/:username'            => 'users#show',
                                         **permit_periods
  patch  '/user/:username'            => 'users#update',
                                         **permit_periods
  delete '/user/:username'            => 'users#destroy',
                                         **permit_periods

end
