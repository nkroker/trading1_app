Rails.application.routes.draw do
	devise_for :users, :controllers => {:registrations => "registrations"}
  get 'dashboard/index'
  # devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  # 	root "devise/sessions#new"
  # end
  root to: 'dashboard#index'


end
