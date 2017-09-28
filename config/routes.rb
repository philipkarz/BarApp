Rails.application.routes.draw do


root 'bars#index'
resources :users
resources :bars 
# resources :reviews
resources :sessions, only: [:new, :create]
# resources :comments
get '/search' => 'bars#search', as: :search
resources :reviews do
    resources :comments
end
# post '/bars/:id/add_to_favorites' => 'bars#add_favorite', as: :favorite
resources :favorites #nested route
post '/bars/:id/add_favorite' => 'favorites#create', as: :add_favorite
delete '/logout' => 'sessions#destroy', as: :logout
end
