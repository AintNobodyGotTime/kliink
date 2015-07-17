Rails.application.routes.draw do

	root to: "site#index"

	get 'site/index'

  get 'project/index' => "project#show"

  get '/project/index' => "donation#create"

  post '/project/index' => "project_item_comment#create"

  post '/point_source/create' => "point_source#create"

  post '/donation/create' => "donation#create"

  resources :projects
	devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

	# devise_scope :user do
	#   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
	#   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	# end

end
