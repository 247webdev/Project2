Rails.application.routes.draw do

  root "access#landingpage", as: :landingpage

  get 'access/landingpage'

  get 'searches/index'


  # get 'searches/results'
  post 'searches/results', to: "searches#results"

  get 'searches/results/:category', to: "searches#resultsShow"

  resources :users

  patch "/users/:id/edit" => 'gifts#update', as: :gift

end

# From rake routes
#        Prefix Verb URI Pattern                                  Controller#Action
#        landingpage GET    /                                     access#landingpage
# access_landingpage GET    /access/landingpage(.:format)         access#landingpage
#     searches_index GET    /searches/index(.:format)             searches#index
#   searches_results POST   /searches/results(.:format)           searches#results
#                    GET    /searches/results/:category(.:format) searches#resultsShow
#              users GET    /users(.:format)                      users#index
#                    POST   /users(.:format)                      users#create
#           new_user GET    /users/new(.:format)                  users#new
#          edit_user GET    /users/:id/edit(.:format)             users#edit
#               user GET    /users/:id(.:format)                  users#show
#                    PATCH  /users/:id(.:format)                  users#update
#                    PUT    /users/:id(.:format)                  users#update
#                    DELETE /users/:id(.:format)                  users#destroy
#               gift PATCH  /users/:id/edit(.:format)             gifts#update
