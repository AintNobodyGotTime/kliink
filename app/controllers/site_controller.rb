class SiteController < ApplicationController
	before_action :authenticate_user!

  def index	
  	@user = current_user 
	end

	def new
	 @user = User.new
	end

end
