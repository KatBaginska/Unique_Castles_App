# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Castle.destroy_all


user = User.create(username: "user101", email: "user@gmail.com", password: "password")

Castle.create(title: "Castle Neuschwanstein", description: "Fairy tale castle to live out your dreams", price: 50 , location: "Bavaria", user: user)
Castle.create(title: "Castle Paris", description: "Cozy, parisian countryside estate ", price: 50, location: "Paris", user: user)
Castle.create(title: "Castle Andalucia", description: "Spanish rustic castle", price: 60, location: "Andalucia", user: user)
Castle.create(title: "Castle Highlands", description: "Enjoy some haggis in a warm castle in the highlands", price: 70, location: "Scottish Highlands", user: user)
