require 'faker'

user = User.new(
	name: "Selene",
	email: "user@example.com",
	password: "password"
	)

user.skip_confirmation!
user.save!

users = User.all

puts "Seed finished"
puts "#{User.count} users created"
