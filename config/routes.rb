Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :sessions, only: [:create]
  resources :registrations, only:[:create]
  resources :groups, only:[:index, :show, :create, :destroy]
  resources :reservations, only:[:index, :create, :destroy]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: redirect("/api-docs")
  resources :groups
end
