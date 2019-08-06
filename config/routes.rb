Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events

  root to: "events#index"

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  post '/logout', to: 'sessions#destroy', as: 'logout'

end
