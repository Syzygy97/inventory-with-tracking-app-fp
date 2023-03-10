Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  
  get 'dashboard', to: "dashboard#index", as: "dashboard"
  resources :categories do
    resources :assets do
      resources :markers
    end
  end
  resources :orders
  
  resources :maps

  resources :deployments

  # namespace :api do
    
  # end
  
  # Defines the root path route ("/")
  root "dashboard#index"
end
