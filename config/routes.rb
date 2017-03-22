Rails.application.routes.draw do

  # necessary for permitting periods which aren't the beginning of a format extension
  permit_periods_in = lambda do |*vars|
    match = /[^\/]+(?=\.json\z)|[^\/]+/
    contraints = vars.map{ |var| [var, match] }.to_h
    Hash(constraints: contraints)
  end

  post   '/login'                    => 'sessions#create'

  get    '/grunts'                   => 'grunts#index'
  # post   '/user/:username/chamber'   => 'grunts#index',
  #                                       **permit_periods_in.(:username)
  get   '/user/:username/chamber'    => 'grunts#index',
                                        **permit_periods_in.(:username)
  post   '/user/:username/grunt'     => 'grunts#create',
                                        **permit_periods_in.(:username)
  get    '/user/:username/grunts'    => 'grunts#show',
                                        **permit_periods_in.(:username)
  get    '/user/:username/grunt/:id' => 'grunts#show',
                                        **permit_periods_in.(:username)
  delete '/user/:username/grunt/:id' => 'grunts#destroy',
                                        **permit_periods_in.(:username)
  get    '/users'                    => 'users#index'
  post   '/user'                     => 'users#create'
  get    '/user/:username'           => 'users#show',
                                        **permit_periods_in.(:username)
  patch  '/user/:username'           => 'users#update',
                                        **permit_periods_in.(:username)
  delete '/user/:username'           => 'users#destroy',
                                        **permit_periods_in.(:username)

  post   '/user/:creeper/creep_on/:username' => 'users#creep_on',
                                                **permit_periods_in.(:creeper,
                                                                     :username)
  get   '/user/:creeper/creeps_on/:username' => 'users#creeps_on',
                                                **permit_periods_in.(:creeper,
                                                                     :username)
  get    '/user/:username/creepers'          => 'users#creepers',
                                                **permit_periods_in.(:username)
  get    '/user/:username/creeping_on'       => 'users#creeping_on',
                                                **permit_periods_in.(:username)

end
