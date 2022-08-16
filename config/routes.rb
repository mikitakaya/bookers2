Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get 'homes/about'

  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"

  resources :books, onle: [:create, :edit, :index, :show, :destroy]
  resources :users, only: [:edit, :index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
