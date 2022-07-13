# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
dealer = Dealer.create!(name: "shomp subaru", city: "denver", open: false, rank:3.5)
car = dealer.cars.create!(name: "brz", color: "yellow", year: 2017, available:false)
car_2 = dealer.cars.create!(name: "wrx", color: "blue", year: 2018, available:true)
dealer_2 = Dealer.create!(name: "Toyota", city: "denver", open: true, rank:2)
car_3 = dealer_2.cars.create!(name: "audi", color: "yellow", year: 2017, available:false)
dealer_3 = Dealer.create!(name: "Jeep", city: "denver", open: true, rank:4)
