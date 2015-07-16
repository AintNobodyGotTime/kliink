Rails.application.routes.draw do
	
  get 'point_source/show'

  get 'donation/create'

  resources :controllers
	devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

	# devise_scope :user do
	#   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
	#   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	# end
	
  get 'site/index'
  
  root to: "site#index" 
  
end
