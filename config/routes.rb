Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'events#index'

  get '/users/:id', to: 'users#show', as: 'user'

  resources :events
  resources :event_attendings, only: [:create, :destroy]
  resources :invitations
end
