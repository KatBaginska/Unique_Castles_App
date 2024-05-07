# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

5.times do
  user = User.create!(
    username: Faker::Internet.unique.username(specifier: 5..8),
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 8)
  )
  puts "User '#{user.username}' created!"
end

# Create castles
User.all.each do |user|
  3.times do
    castle = Castle.create!(
      title: Faker::Book.title,
      description: Faker::Lorem.sentence,
      price: Faker::Number.between(from: 50, to: 200),
      location: Faker::Fantasy::Tolkien.location,
      user: user
    )
    puts "Castle '#{castle.title}' created!"
  end
end

