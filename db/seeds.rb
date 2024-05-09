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

puts "Cleaning up the db"
Booking.destroy_all
Castle.destroy_all
User.destroy_all


puts "Creating users"
kate = User.create(username: "Kate", email: "kate@gmail.com", first_name: "Kate", last_name: "Coates", password: "123456")
john = User.create(username: "John", email: "john@gmail.com", first_name: "John", last_name: "Doe", password: "123456")

puts "Creating castles"
file = URI.open("https://d1xw84ija6gjgy.cloudfront.net/production/0d73a25092e5c1c9769a9f3255caa65a/conversions/HD.jpg")
file_1 = URI.open("https://i0.wp.com/nc500experience.com/wp-content/uploads/2023/03/Eilean-Donan-Castle-Visitor-Centre-1.jpg?ssl=1")
file_2 = URI.open("https://photostorage.explorest.com/europe/uk/mkuhr-eilean-donan-drone-compressed.jpg")
file_3 = URI.open("https://www.thecastlesofscotland.co.uk/s/cc_images/teaserbox_2480762761.jpg?t=1541514474")
file_4 = URI.open("https://directionallychallengedtraveler.com/wp-content/uploads/2020/02/Eilean-Donan-1-1024x768.jpg")


castle = Castle.new(title: "Eilean Donan Castle",
    description: "Feel like Robert the Bruce for a few days! Eilean Donan Castle is situated on an island at the point where three great sea lochs meet, and surrounded by some majestic scenery, you can survey the land like the warrior you are!",
    price: 100,
    location: "Dornie, Kyle of Lochalsh, Scotland",
    user: kate)
castle.photos.attach(io: file, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_1, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_2, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_3, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_4, filename: "image.jpg", content_type: "image/jpg")
castle.save

file = URI.open("https://images.unsplash.com/photo-1609237756221-88c4a93846b2?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGNhc3RsZXN8ZW58MHx8MHx8fDA%3D")
file_1 = URI.open("https://cdn.britannica.com/27/101827-004-3236235E/Neuschwanstein-Castle-Bavarian-Alps-Germany.jpg")
file_2 = URI.open("https://www.neuschwanstein.de/bilder/schloss/saengersaal575.jpg")
file_3 = URI.open("https://www.neuschwanstein.de/bilder/schloss/schlafzimmer575.jpg")
file_4 = URI.open("https://www.travelandleisure.com/thmb/QtJWjakkqPMimxOCuXBw0YiWpbI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/13-interior-general-NEUSCHWANSTEIN0417-321d0de05a9b442a84f3189ecf054b21.jpg")

castle = Castle.new(title: "Neuschwanstein Castle",
    description: "A 19th-century historicist palace on a rugged hill of the foothills of the Alps in the very south of Germany, near the border with Austria. A welcoming and luxurious castle in a flowery park. Chateau and outbuildings for hosting very large families and groups of friends. Dedicated spaces, large meals, many amenities for a variety of activities.
    Fully private property for its guests - Premium Jacuzzi - Gym - Home Massage Service - (optional services for a wellness stay. Contact us:))",
    price: 120,
    location: "Foothills of the Alps, Southern Germany",
    user: kate)
castle.photos.attach(io: file, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_1, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_2, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_3, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_4, filename: "image.jpg", content_type: "image/jpg")
castle.save

file = URI.open("https://t3.ftcdn.net/jpg/05/33/38/14/360_F_533381423_CMKiD8S5RmBIU3axeBnwRf9TvMCUQSV5.jpg")
castle = Castle.new(title: "Herstmonceux Castle",
    description: "Dating from the 15th century, Herstmonceux is one of the oldest significant brick buildings still standing in England.",
    price: 110,
    location: "East Sussex, England",
    user: john)
castle.photos.attach(io: file, filename: "image.jpg", content_type: "image/jpg")
castle.save

file = URI.open("https://res.cloudinary.com/dfghvsvgn/image/upload/v1715183713/production/etqv2qmeiptxl02aothbmlm0b7g5.png")
castle = Castle.new(title: "Grotta Palazzese",
    description: "A magical and enchanted place with a restaurant and terrace created inside a cave.",
    price: 90,
    location: "Puglia, Italy",
    user: john)
castle.photos.attach(io: file, filename: "image.png", content_type: "image/png")
castle.save

file = URI.open("https://res.cloudinary.com/dfghvsvgn/image/upload/v1715183912/production/tpszhjf7fmbwvtocmf9bi1hlg70f.png")
castle = Castle.new(title: "Castle Sizergh,",
    description: "Surrounded by beautiful gardens, featuring a limestone rock garden, pasture land, and woodlands which support a large butterfly population.",
    price: 500,
    location: "Cumbria, England",
    price: 150,
    user: john)
castle.photos.attach(io: file, filename: "image.png", content_type: "image/png")
castle.save

puts "Created #{Castle.count} castles"
