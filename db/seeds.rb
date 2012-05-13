# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	puts 'EMPTY THE MONGODB DATABASE'
	Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
	puts 'SETTING UP DEFAULT USER LOGIN'
	user = User.create! :name => 'admin', :email => 'pravinmishra88@gmail.com', :password => 'admin1234', :password_confirmation => 'admin1234', :role => 'admin'
	puts 'New user created: ' << user.name
	puts 'SETTING UP AdminUser'
	AdminUser.create(:email => 'bob@example.com', :password => 'password', :password_confirmation => 'password')

