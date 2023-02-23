Rails.application.routes.draw do
  resources :hotels
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  resources :clients
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'clients#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
