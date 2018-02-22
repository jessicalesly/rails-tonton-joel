# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.last)

user1 = User.new(username: "ClemSimons", email: "clement@gmail.com", password: "123456")
user1.save!

user2 = User.new(username: "jessicalesly", email: "jessica@gmail.com", password: "123456")
user2.save!

rum1 = Rum.new(name: "Le planteur", price: 10, volume: "1 bouteille", origin: "Antilles")
rum1.user = User.first
rum1.save!

rum2 = Rum.new(name: "Le punch", price: 11, volume: "2 bouteilles", origin: "Antilles")
rum2.user = User.first
rum2.save!

rum3 = Rum.new(name: "Le ti'punch", price: 12, volume: "3 bouteilles", origin: "Antilles")
rum3.user = User.first
rum3.save!

rum4 = Rum.new(name: "Le cuba libre", price: 13, volume: "4 bouteilles", origin: "Cuba")
rum4.user = User.first
rum4.save!

rum5 = Rum.new(name: "Le daiquiri", price: 14, volume: "5 bouteilles", origin: "Cuba")
rum5.user = User.first
rum5.save!

order1 = Order.new(quantity: 1)
order1.user = User.last
order1.rum = rum1
order1.save!

order2 = Order.new(quantity: 2)
order2.user = User.last
order2.rum = rum2
order2.save!

order3 = Order.new(quantity: 3)
order3.user = User.last
order3.rum = rum3
order3.save!

order4 = Order.new(quantity: 4)
order4.user = User.last
order4.rum = rum4
order4.save!

order5 = Order.new(quantity: 5)
order5.user = User.last
order5.rum = rum5
order5.save!
