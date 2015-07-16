class ProjectItem < ActiveRecord::Base
	
	belongs_to :project
	has_many :project_item_comments

end
