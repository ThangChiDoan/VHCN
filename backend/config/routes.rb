Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # API routes
  namespace :api do
    namespace :v1 do
      post 'login', to: 'auth#login'
      post 'register', to: 'auth#register'
      resources :users
      resources :products
      resources :categories
      resources :orders
      resources :order_items
      resources :reviews
      resources :addresses
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
