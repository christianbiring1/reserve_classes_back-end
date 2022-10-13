Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  resources :registrations, only:[:create]
  resources :groups, only:[:index, :show, :create, :destroy]
  resources :reservations, only:[:index, :create, :destroy]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: 'static#home'
  resources :groups
end
