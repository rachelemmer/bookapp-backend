Rails.application.routes.draw do
  resources :books, only: [:index, :create]
  resources :users, only: [:index, :create]
  get "favorites", to: "users#favorite_books"
  post "login", to: "authentication#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
