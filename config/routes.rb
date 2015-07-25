Rails.application.routes.draw do

  get 'admin/users'

  get 'comments/new'

  get 'comments/show'

	root to: "project#show"

	get 'site/index'

  get 'project/index' => "project#show"

  get '/project/index' => "donation#create"

  post '/' => "comments#create"

  post '/point_source/create' => "point_source#create"

  post '/donation/create' => "donation#create"

  resources :projects
  resources :project_items
	devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

	# devise_scope :user do
	#   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
	#   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	# end

end
