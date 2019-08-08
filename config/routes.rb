Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"

  resources :users
  resources :clients do
    resources :notes
  end

  resources :sessions, only: [:new, :create, :destroy]

  post '/logout', to: 'sessions#destroy', as: 'logout'

  get 'signin', to: redirect('/auth/google_oauth2'), as: 'signin'
  # get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'register', to: "users#new", as: 'register'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

end
