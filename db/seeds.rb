# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: 'yevgen@gmail.com', password: '63XhafRvb')
ActsAsTaggableOn::Tag.create(name: 'project commercial')
ActsAsTaggableOn::Tag.create(name: 'project privat')
ActsAsTaggableOn::Tag.create(name: 'project finished')

Page.create(title: 'Home page', description: 'This is home page', content: 'change me!!!!!!!')
