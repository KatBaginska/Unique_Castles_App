# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Booking.destroy_all
Castle.destroy_all
User.destroy_all

kate = User.create(username: "Kate", email: "kate@gmail.com", password: "123456")
john = User.create(username: "John", email: "john@gmail.com", password: "123456")

Castle.create(title: "Eilean Donan Castle",
  description: "Eilean Donan is recognised as one of the most iconic images of Scotland  all over the world. Situated on an island at the point where three great sea lochs meet, and surrounded by some majestic scenery",
  price: 100,
  location: "Dornie by Kyle of Lochalsh Scotland",
  user: kate,
  image_url: "https://lh3.googleusercontent.com/p/AF1QipOXd2581cUVVw11ZknL_Ec7Ha_N_bgNrYFIVaLf=s680-w680-h510"
)

Castle.create(title: "Neuschwanstein Castle",
    description: "A 19th-century historicist palace on a rugged hill of the foothills of the Alps in the very south of Germany, near the border with Austria",
    price: 120,
    location: "Foothills of the Alps, Southern Germany ",
    user: kate,
    image_url: "https://en.wikipedia.org/wiki/Neuschwanstein_Castle"
  )

Castle.create(title: "Herstmonceux Castle",
    description: "Herstmonceux Castle is a brick-built castle, dating from the 15th century, near Herstmonceux, East Sussex, England. It is one of the oldest significant brick buildings still standing in England",
    price: 120,
    location: "East Sussex, England",
    user: john,
    image_url: "https://t3.ftcdn.net/jpg/05/33/38/14/360_F_533381423_CMKiD8S5RmBIU3axeBnwRf9TvMCUQSV5.jpg"
  )
