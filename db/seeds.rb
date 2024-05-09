# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

Booking.destroy_all
Castle.destroy_all
User.destroy_all

kate = User.create(username: "Kate", email: "kate@gmail.com", password: "123456")
john = User.create(username: "John", email: "john@gmail.com", password: "123456")

  file = URI.open("https://lh3.googleusercontent.com/p/AF1QipOXd2581cUVVw11ZknL_Ec7Ha_N_bgNrYFIVaLf=s680-w680-h510")
castle = Castle.new(title: "Eilean Donan Castle",
    description: "Situated on an island at the point where three great sea lochs meet, and surrounded by some majestic scenery.",
    price: 100,
    location: "Dornie, Kyle of Lochalsh, Scotland",
    user: kate)
castle.photo.attach(io: file, filename: "image.png", content_type: "image/png")
castle.save

file = URI.open("https://res.cloudinary.com/dfghvsvgn/image/upload/v1715181839/development/k07a2fuhapfcfuybw08d9cp89bed.jpg")
castle = Castle.new(title: "Neuschwanstein Castle",
    description: "A 19th-century historicist palace on a rugged hill of the foothills of the Alps in the very south of Germany, near the border with Austria.",
    price: 120,
    location: "Foothills of the Alps, Southern Germany",
    user: kate)
castle.photo.attach(io: file, filename: "image.jpg", content_type: "image/jpg")
castle.save

file = URI.open("https://t3.ftcdn.net/jpg/05/33/38/14/360_F_533381423_CMKiD8S5RmBIU3axeBnwRf9TvMCUQSV5.jpg")
castle = Castle.new(title: "Herstmonceux Castle",
    description: "Dating from the 15th century, Herstmonceux is one of the oldest significant brick buildings still standing in England.",
    location: "East Sussex, England",
    user: john)
castle.photo.attach(io: file, filename: "image.jpg", content_type: "image/jpg")
castle.save

file = URI.open("https://res.cloudinary.com/dfghvsvgn/image/upload/v1715183713/production/etqv2qmeiptxl02aothbmlm0b7g5.png")
castle = Castle.new(title: "Grotta Palazzese",
    description: "A magical and enchanted place with a restaurant and terrace created inside a cave.",
    location: "Puglia, Italy",
    user: john)
castle.photo.attach(io: file, filename: "image.png", content_type: "image/png")
castle.save

file = URI.open("https://res.cloudinary.com/dfghvsvgn/image/upload/v1715183912/production/tpszhjf7fmbwvtocmf9bi1hlg70f.png")
castle = Castle.new(title: "Castle Sizergh,",
    description: "Surrounded by beautiful gardens, featuring a limestone rock garden, pasture land, and woodlands which support a large butterfly population.",
    location: "Cumbria, England",
    user: john)
castle.photo.attach(io: file, filename: "image.png", content_type: "image/png")
castle.save
