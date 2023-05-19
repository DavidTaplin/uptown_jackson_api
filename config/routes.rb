Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :buildings, defaults: {format: 'json'} do
    get :index
    post :create
    delete :destroy
  end

  devise_for :users

  resources :users, only: [:edit, :update, :destroy]


end
