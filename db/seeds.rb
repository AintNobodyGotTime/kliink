# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ngo.create(name:'Sukrupa’s Rajendra School Project', description: 'Sukrupa is a non­profit based in Bangalore India that focuses on creating educational opportunities for children living in extreme poverty.')

Project.create(description: 'We are building a 7,500 square foot school located in Rajendra Nagar Slum, one of the most impoverished areas in Bangalore India. The building will provide free schooling to children of families earning less than 20,000 rupees a year. This 15 classroom school will accommodate 300 children and create 30 new jobs. Sukrupa\'s goal is to raise $40,000US. Construction will take approximately nine months.', name: 'Building a School', ngo_id:1)

ProjectItem.create(content:'This 7,500 sq. ft. school will have 15 rooms and will accommodate 300 children.', project_id:1)
ProjectItem.create(content:'The Rajendra Nagar slum is home to some of the poorest people in southern India. 60% of the children do not attend school full time and over 50% do not make it to high school.', project_id:1)
ProjectItem.create(content:'What these children lack in resources they make up in perserverance. These kids are very hard working and often work long hours in construction and domestic service to pay, and sometimes in lieu of their schooling.', project_id:1)