Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sessions#new"

  resources :clients
  resources :notes
  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  post '/logout', to: 'sessions#destroy', as: 'logout'

  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  # get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

end
