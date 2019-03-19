Rails.application.routes.draw do
	devise_for :users, :controllers => {:registrations => "registrations"}
  # devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  # 	root "devise/sessions#new"
  # end
  get 'welcome/index'
  root to: 'welcome#index'


end
