Rails.application.routes.draw do
  resources :characters
  resources :tournaments
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"
  get 'tournament/registrate_user/:id', controller: 'tournaments', action: 'registrate_user', as: 'registrate_user_tournament'
end
