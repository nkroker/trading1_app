Rails.application.routes.draw do

	devise_for :users, :controllers => {:registrations => "registrations"}

  resources :dashboard, only: :index

  root to: 'dashboard#index'
  resources :investments, only: [:create, :index, :new]

  resources :charges, only: [:new, :create]

end
