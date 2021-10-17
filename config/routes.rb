Rails.application.routes.draw do
  #auth routes config
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  #root :to => "users#new"
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #defining root view
  root "home#index"
  #defining link routes
  get "/home", to: "home#index"
  get "/articles", to: "articles#index"

  #this is a resourcefull method for routing all CRUD conventional operations
  resources :articles do
    resources :comments
  end
end
