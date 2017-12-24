Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items
  resources :users
  resources :sessions
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post "/sessions/new", to: "sessions#create", as: "signin"
  resources :comments
end
