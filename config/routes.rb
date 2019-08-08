Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"

  resources :users do
    resources :clients
    resources :caseloads
  end

  resources :clients do
    resources :notes
  end

  resources :sessions, only: [:new, :create, :destroy]

  post '/signout', to: 'sessions#destroy', as: 'signout'

  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signin_with_google', to: redirect('/auth/google_oauth2'), as: 'signin_with_google'
  get 'register', to: "users#new", as: 'register'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

end
