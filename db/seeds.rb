require 'faker'

user = User.new(
	name: "Selene",
	email: "fake2@example.com",
	password: "password"
	)

user.skip_confirmation!
user.save!

users = User.all

10.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
    )
end

items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
