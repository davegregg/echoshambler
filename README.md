# README

Usernames passed in the path are not case sensitive and may contain periods.

post   '/login'                    => 'sessions#create'
get    '/grunts'                   => 'grunts#index'
get    '/users'                    => 'users#index'
post   '/user'                     => 'users#create'
post   '/user/:username/chamber'   => 'grunts#index'
post   '/user/:username/grunt'     => 'grunts#create'
get    '/user/:username/grunts'    => 'grunts#show'
get    '/user/:username/grunt/:id' => 'grunts#show'
delete '/user/:username/grunt/:id' => 'grunts#destroy'
get    '/user/:username'           => 'users#show'
patch  '/user/:username'           => 'users#update'
delete '/user/:username'           => 'users#destroy'
post   '/user/:creeper/creep_on/:username'  => 'users#creep_on'
get    '/user/:creeper/creeps_on/:username' => 'users#creeps_on'
get    '/user/:username/creepers'           => 'users#creepers'
get    '/user/:username/creeping_on'        => 'users#creeping_on'
