Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  post '/favorites/:topic_id/destroy', to: 'favorites#destroy'
  
  get 'comments/new',　to: 'comments#new'
  post '/comments', to: 'comments#create'
  
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
