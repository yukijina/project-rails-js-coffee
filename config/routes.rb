Rails.application.routes.draw do
  resources :beans, only: [:index]
  resources :roasters do
    resources :beans
  end
  root 'sessions#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get  '/signup', to: 'users#new'

  resources :users, only: [:show, :create]

end
