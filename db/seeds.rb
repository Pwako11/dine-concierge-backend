# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(name: "Patrick", email:"test@mail.com")
Reservation.create(restaurant_name: "Laurrapin Grille", booked_time: Date.today(), booked_email: "test@mail.com", notes: "I would preffer a table away from traffic and silent. Also windo sitting is preffered.", reserved: true, user: u)
puts "Succeeded"