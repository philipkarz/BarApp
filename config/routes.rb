Rails.application.routes.draw do

  

root 'bars#index'
resources :users
resources :bars 
# resources :reviews
resources :sessions, only: [:new, :create]
# resources :comments

resources :reviews do
    resources :comments
end
delete '/logout' => 'sessions#destroy', as: :logout
end
