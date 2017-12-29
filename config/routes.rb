Rails.application.routes.draw do
  resources :characters
  resources :tournaments
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"
end
