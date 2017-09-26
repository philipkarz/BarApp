Rails.application.routes.draw do

root 'bars#index'
resources :users
resources :bars 
resources :reviews
resources :sessions, only: [:new, :create]
delete '/logout' => 'sessions#destroy', as: :logout
end
