Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: "gossips#index" #donne l'info sur où se trouve la racine
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  #get 'author/:id', to: 'users#show', as: 'user'

  resources :gossips #va générer toutes les routes Gossip en auto
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
end
