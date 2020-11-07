Rails.application.routes.draw do
  resources :memes
  resources :users, only: [:index, :show, :new, :create]
  resources :messages
  resources :categories, only: [:index, :show]
  get '/', to: 'application#home', as: 'home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
