Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :buildings, defaults: {format: 'json'} do
    get :index
    post :create
    delete :destroy
    patch :update
  end
  get 'buildings/user', to: 'buildings#get_user_buildings'
  get 'buildings/:id', to: 'buildings#show'
  delete 'buildings/:id', to: 'buildings#destroy'

  devise_for :users

  resources :users, only: [:update, :destroy]
end
