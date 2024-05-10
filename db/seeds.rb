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
    description: "Feel like Robert the Bruce for a few days! Eilean Donan Castle is situated on an island at the point where three great sea lochs meet, and surrounded by some majestic scenery, you can survey the land like the warrior you are!
    The rooms are painstakingly restored following the medieval theme, truely a fairytale experience. The castle can accommodate large family or friends looking for a retreat away from it all. ",
    price: 550,
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
    description: "Live out your fairytale! Neuschwanstein is a 19th-century historicist palace on a rugged hill of the foothills of the Alps in the very south of Germany, near the border with Austria. A welcoming and luxurious castle with outbuildings for hosting very large families and groups of friends. Dedicated spaces, large meals, many amenities for a variety of activities.
    Fully private property for its guests - Premium Jacuzzi - Gym - Home Massage Service - (optional services for a wellness stay. Contact us:))",
    price: 600,
    location: "Foothills of the Alps, Southern Germany",
    user: kate)
castle.photos.attach(io: file, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_1, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_2, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_3, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_4, filename: "image.jpg", content_type: "image/jpg")
castle.save

file = URI.open("https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2Fc0ac06b4-74a1-11e8-a4b0-c06c25e9bae2.jpg?crop=3972%2C2234%2C47%2C1483")
file_1 = URI.open("https://www.amberleycastle.co.uk/uploads/GalleryImage/p1arstq8k5uft1ltu1ncqaq91h4f7-4.jpg")
file_2 = URI.open("https://www.amberleycastle.co.uk/uploads/RoomImage/p1aqcg1mscpc21ufpas87g11err9-35.jpg")
file_3 = URI.open("https://q-xx.bstatic.com/xdata/images/hotel/max750/65369577.jpg?k=6148ff0d162fab3b31ae6581d0c4ac636add7720d7861a229ef079ca3179c1af&o=")
file_4 = URI.open("https://www.amberleycastle.co.uk/uploads/RoomImage/p1aqcfd9prl4v1jfm8uh1uc12ev9-22.jpg")
castle = Castle.new(title: "Amberley Castle",
    description: "Amberley Castle is a unique luxury place to stay located in the picturesque village of Amberley at the foot of the South Downs. This magnificent 900-year-old castle is enclosed by a 60 foot high curtain wall and portcullis that remains open, behind which you will discover an enchanting world offering the highest standards of comfort. The bedrooms are resplendent with  luxurious facilities fit for a king or queen!
    History encompasses every part of this wonderful building and the many acres of gardens it stands in. Enjoy discovering our tennis courts, 18-hole putting green and croquet lawn, and even our resident peacock roaming the grounds. For those seeking tranquillity and relaxation, there are many quiet corners to discover under the shade of a tree or by the fireside..",
    price: 600,
    location: "East Sussex, England",
    user: john)
castle.photos.attach(io: file, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_1, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_2, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_3, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_4, filename: "image.jpg", content_type: "image/jpg")
castle.save

file = URI.open("https://res.cloudinary.com/dfghvsvgn/image/upload/v1715183713/production/etqv2qmeiptxl02aothbmlm0b7g5.png")
file_1 = URI.open("https://cf.bstatic.com/xdata/images/hotel/max1024x768/211489781.jpg?k=b05dd05ec5fd57a67015cae3f158305bcb2efaf77b1d06ca9bbcf1402d1066ce&o=&hp=1")
file_2 = URI.open("https://www.grottapalazzese.it/wp-content/uploads/2019/06/152-Suite_Grotta-Palazzese-5092.jpg")
file_3= URI.open("https://www.grottapalazzese.it/wp-content/uploads/2018/03/Grotta-Palazzese-tavolo-centrale.jpg")
file_4 = URI.open("https://www.grottapalazzese.it/wp-content/uploads/2020/06/Grotta-Palazzese-1900x1260.jpg")
castle = Castle.new(title: "Grotta Palazzese",
    description: "The castle by the sea! A magical and enchanted place, with a restaurant and terrace on the lower floor created inside a natural cave. The Grotta Palazzese restaurant takes its name from the cave and from the place that was once also called 'Grotta di Palazzo'. It is an exclusive and atmospheric place, and has been used for parties and banquets since 1700. The blue of the sea and the sky contrasts with the mysterious atmosphere of the natural rocks. The colours of the day make the beauty of the coastal landscape shine, while those of the evening, at sunset, create unforgettable charm with the elegance of the restaurant lights.",
    price: 650,
    location: "Puglia, Italy",
    user: john)
castle.photos.attach(io: file, filename: "image.png", content_type: "image/png")
castle.photos.attach(io: file_1, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_2, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_3, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_4, filename: "image.jpg", content_type: "image/jpg")
castle.save

file = URI.open("https://res.cloudinary.com/dfghvsvgn/image/upload/v1715183912/production/tpszhjf7fmbwvtocmf9bi1hlg70f.png")
file_1 = URI.open("https://www.parkcliffe.co.uk/wp-content/uploads/2020/04/sizergh-castle.jpg")
file_2 = URI.open("https://www.english-lakes.com/images/lakes_14/siz34.jpg")
file_3 = URI.open("https://i.guim.co.uk/img/media/437c1c2237a7aedfb640a3aee4046a3b026c973d/0_0_6016_3608/master/6016.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=bc89da8fabd0f403840dad49accbc666")
file_4 = URI.open("https://i0.wp.com/holmeandaway-com.lyricalstaging.com/wp-content/uploads/2018/06/img_5162-1.jpg?resize=3808%2C2306")
castle = Castle.new(title: "Castle Sizergh",
    description: "Reign in style in this majestic 14th-century castle in stunning Cumbrian countryside.
    Steeped in history, Castle Sizergh has been restored with loving attention to detail and is in a stunning location. Surrounded by beautiful gardens, featuring a limestone rock garden, pasture land, and woodlands which support a large butterfly population.
    The Castle is perfect for large gatherings but equally it has intimate hidden corners where guests can enjoy a quiet moment with a abundant views over the countryside.",
    price: 400,
    location: "Cumbria, England",
    user: john)
castle.photos.attach(io: file, filename: "image.png", content_type: "image/png")
castle.photos.attach(io: file_1, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_2, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_3, filename: "image.jpg", content_type: "image/jpg")
castle.photos.attach(io: file_4, filename: "image.jpg", content_type: "image/jpg")
castle.save

puts "Created #{Castle.count} castles"
