Rails.application.routes.draw do
  
  resources :memes
  resources :users, only: [:index, :show, :new, :edit, :create]
  
  
  resources :messages
  resources :categories, only: [:index, :show]
  get '/', to: 'application#home', as: 'home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete '/logout', to: 'sessions#destroy'
  
  # devise_for :users, path: '', controllers: { :registrations => 'registrations' }, path_names: {sign_up: "register", sign_in: "login", sign_out: "logout"}



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
