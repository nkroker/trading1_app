Rails.application.routes.draw do

  get 'admin/index'
	devise_for :users, :controllers => {:registrations => "registrations", :invitations => "invitations" }

  resources :dashboard, only: :index

  root to: 'dashboard#index'
  resources :investments, only: [:create, :index, :new]

  resources :charges, only: [:new, :create]

  resources :admin, only: [:index]

end
