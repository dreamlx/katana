# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if User.where(email: 'admin@example.com').size == 0
	User.create!(name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
JobCode.create!( title: '00:self_study')
JobCode.create!( title: '05:company_admin')
JobCode.create!( title: '10:client_service')
JobCode.create!( title: '15:others')
