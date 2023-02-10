Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"

  devise_for :users

  resources :categories do
    resources :assets do
      resources :orders
      resources :markers
    end
  end

  resources :maps
end
