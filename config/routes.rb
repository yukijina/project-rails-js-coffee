Rails.application.routes.draw do
  resources :beans
  resources :roasters do
    resources :beans
  end

  resources :roasters, only: [:index]
  resources :favorite_and_comments, as: :comments
  resources :users, only: [:show, :new, :create]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get  '/signup', to: 'users#new'

  root 'sessions#home'
end
