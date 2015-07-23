class ProjectItem < ActiveRecord::Base
	
	belongs_to :project
	has_many :likes

	validates_uniqueness_of :content

end
