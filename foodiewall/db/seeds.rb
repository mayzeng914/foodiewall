# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
foodiepictures = Foodiepicture.create([
	{image: ../app/assets/images.dimsum.jpg, description: "This is the desciption for dimsum."},
	{image: ../app/assets/images.italian.jpg, description: "This is the desciption for italian."},
	{image: ../app/assets/images.newamerican.jpg, description: "This is the desciption for newamerican."},
	{image: ../app/assets/images.seafood.jpg, description: "This is the desciption for seafood."},
	{image: ../app/assets/images.steakhouse.jpg, description: "This is the desciption for steakhouse."}
])