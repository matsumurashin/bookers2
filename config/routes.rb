Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:new, :index, :show, :create, :destroy, :edit, :update]
  get "home/about" => "homes#about", as: 'about'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
