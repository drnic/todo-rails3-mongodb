# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts "Empty the MongoDB database"
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts "Setting up the default user login"
user = User.create! :name => 'Douglas', :email => 'dbalexandre@gmail.com', :password => 'fidelio', :password_confirmation => 'fidelio'
puts "New user created: #{user.name}" 
