Rails.application.routes.draw do
  resources :memes
  resources :users
  resources :messages
  resources :categories
  get '/', to: 'application#home', as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
