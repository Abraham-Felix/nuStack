Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #defining root view
  root "home#index"
  get "/home", to: "home#index"
  #this is a resourcefull method for routing all CRUD conventional operations
  resources :articles
end
