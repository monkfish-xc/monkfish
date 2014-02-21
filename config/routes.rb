# == Route Map (Updated 2014-02-09 04:17)
#
#      Prefix Verb   URI Pattern               Controller#Action
#        root GET    /                         static_pages#home
#        help GET    /help(.:format)           static_pages#help
#       about GET    /about(.:format)          static_pages#about
#       users GET    /users(.:format)          users#index
#             POST   /users(.:format)          users#create
#    new_user GET    /users/new(.:format)      users#new
#   edit_user GET    /users/:id/edit(.:format) users#edit
#        user GET    /users/:id(.:format)      users#show
#             PATCH  /users/:id(.:format)      users#update
#             PUT    /users/:id(.:format)      users#update
#             DELETE /users/:id(.:format)      users#destroy
#      signup GET    /signup(.:format)         users#new
#    sessions POST   /sessions(.:format)       sessions#create
# new_session GET    /sessions/new(.:format)   sessions#new
#     session DELETE /sessions/:id(.:format)   sessions#destroy
#      signin GET    /signin(.:format)         sessions#new
#     signout DELETE /signout(.:format)        sessions#destroy
#       posts POST   /posts(.:format)          posts#create
#        post DELETE /posts/:id(.:format)      posts#destroy
#

Monkfish::Application.routes.draw do
  root 'static_pages#home'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'

  resources :users
  match '/signup', to: 'users#new', via: 'get'
  
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  resources :posts, only: [:show, :create, :destroy]

  resources :cohortships do
    collection do
      get :req
      get :accept
      get :reject      
    end
  end
end
