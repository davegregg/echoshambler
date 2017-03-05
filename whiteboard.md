# WHITEBOARD

ROADMAP:
- Login/Session
- Creeping
- Delete User

Prefix Verb   URI Pattern           Controller#Action
 users GET    /users(.:format)      users#index
       POST   /users(.:format)      users#create
  user GET    /users/:id(.:format)  users#show
       PATCH  /users/:id(.:format)  users#update
       PUT    /users/:id(.:format)  users#update
       DELETE /users/:id(.:format)  users#destroy
grunts GET    /grunts(.:format)     grunts#index
       POST   /grunts(.:format)     grunts#create
 grunt GET    /grunts/:id(.:format) grunts#show
       PATCH  /grunts/:id(.:format) grunts#update
       PUT    /grunts/:id(.:format) grunts#update
       DELETE /grunts/:id(.:format) grunts#destroy
 login POST   /login(.:format)      sessions#create
