class Project < ActiveRecord::Base
	
	has_many :project_items
	has_many :donations

end
