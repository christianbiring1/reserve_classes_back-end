Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  resources :registrations, only:[:create]
<<<<<<< HEAD
  resources :groups, only:[:index, :show, :create, :destroy]
=======
  resources :reservations, only:[:index, :create]
>>>>>>> develop
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  # for reservations
  # get :reservations, to: "reservations#index"
  # post :reservations, to: "reservations#new"
  # get :groups, to: "groups#all"
  root to: 'static#home'
  resources :groups

  # Defines the root path route ("/")
  # root "articles#index"
end
