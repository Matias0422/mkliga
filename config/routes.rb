Rails.application.routes.draw do
  resources :locations
  resources :characters
  resources :tournaments
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"
  get 'tournament/registrate_user/:id', controller: 'tournaments', action: 'registrate_user', as: 'registrate_user_tournament'
  get 'tournament/destroy_user', controller: 'tournaments', action: 'destroy_user', as: 'destroy_user_tournament'
  get 'tournament/new/:id', controller: 'tournaments', action: 'new', as: 'new_new_tournament'
end
