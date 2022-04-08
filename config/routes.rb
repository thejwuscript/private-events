Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'events#index'

  get '/users/:id', to: 'users#show', as: 'user'

  resources :events
end
