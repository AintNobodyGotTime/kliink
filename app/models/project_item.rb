class ProjectItem < ActiveRecord::Base
	
	belongs_to :project
	has_many :likes

end
