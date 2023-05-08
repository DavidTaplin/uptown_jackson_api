Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :buildings, defaults: {format: 'json'} do
    get :index
    get 'show/:id', to: 'buildings#show', as: 'show'
    post :create
    delete :destroy
  end

  # resources :users
  namespace :users, defaults: {format: 'json'} do
    post :create
  end
  
  resources :sessions
  #create '/login', to: 'sessions#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
