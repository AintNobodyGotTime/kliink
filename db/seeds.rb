# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ngo.create(name:'Sukrupa’s Rajendra School Project', description: 'Sukrupa is a non­profit based in Bangalore India that focuses on creating educational opportunities for children living in extreme poverty.')

Project.create(description: 
'We are building a 7,500 square foot school located in Rajendra Nagar Slum, one of the most impoverished areas in Bangalore India. The building will provide free schooling to children of families earning less than 20,000 rupees a year. This 15-classroom school will accommodate 300 children and create 30 new jobs. Sukrupa’s goal is to raise 40,000USD. Construction will take approximately nine months. The majority of the children in Rajendra do not attend school full time and never enter high school. What these children lack in resources they make up in perseverance. They are hardworking and often work long hours in construction and domestic service to pay for school, sometimes in lieu of attending classes.
', name: 'Sukrupa’s Rajendra School Project', ngo_id:1)

ProjectItem.create(title: 'Clearing the land', content: 'The school is built on almost 2 acres.', project_id:1)
ProjectItem.create(title: 'Laying the bricks!', content: 'It takes a crew of 40+ workers to construct the school. These workers have been working all day for weeks on end to get this structure up. Many of the worker\'s children will attend the school.', project_id:1)
ProjectItem.create(title:'Installing furniture', content: 'These desks and chairs were made locally at a furniture factory in north Bangalore. The lumber used to make the seats and chairs are sourced within 400 km and are taken from sustainable foresting.', project_id:1 )
ProjectItem.create(title: 'Library books', content: 'Over 700 books will fill the library', project_id:1)
ProjectItem.create(title: 'Computer Lab', content: '10 Computers will be used by the children. Each class gets computer time once a week to learn valuable 21 century', project_id:1)
ProjectItem.create(title:'School bus arrives', content:'The school bus will be used for children who live more than 4km away from the school', project_id:1)