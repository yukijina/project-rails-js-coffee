Rails.application.routes.draw do
  resources :beans, only: [:index]
  resources :roasters do
    resources :beans
  end

  resources :favorite_and_comments, as: :comments
  resources :users, only: [:show, :new, :create]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get  '/signup', to: 'users#new'

  root 'sessions#home'
end
