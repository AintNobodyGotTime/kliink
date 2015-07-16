Rails.application.routes.draw do
	
	devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
	resources :users
  
  get 'site/index'
  
  root to: "site#index"

  
end
