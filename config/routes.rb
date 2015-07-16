Rails.application.routes.draw do
  get 'site/index'
  
  root to: "site#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
	resources :users
end
