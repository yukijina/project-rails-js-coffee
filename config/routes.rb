Rails.application.routes.draw do
  resources :beans
  resources :roasters
  root 'sessions#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get  '/signup', to: 'users#new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
