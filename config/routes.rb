Rails.application.routes.draw do
  root to: 'pages#home'
  get 'users/new', to: 'users#new', as: :new_user
  post 'users', to: 'users#create'
  # get ‘conversations/index’
  resources :users
  resources :profiles
  resources :pets
  resources :breeds
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
