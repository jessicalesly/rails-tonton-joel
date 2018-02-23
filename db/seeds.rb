# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.last)

puts 'Cleaning database...'
Review.destroy_all
Order.destroy_all
Rum.destroy_all
User.destroy_all

puts 'Creating users...'
clément = User.create!({
  username: "Clément",
  email: "clement@gmail.com",
  password: "123456"
})
jessica = User.create!({
  username: "Jessica",
  email: "jessica@gmail.com",
  password: "123456"
})
jeanmich = User.create!({
  username: "Jean-Mich",
  email: "jeanmich@gmail.com",
  password: "123456"
})
eveangeli = User.create!({
  username: "EveAngeli",
  email: "eveangeli@gmail.com",
  password: "123456"
})
fruitdelapassion = User.create!({
  username: "FruitDeLaPassion",
  email: "fruit@gmail.com",
  password: "123456"
})
francky = User.create!({
  username: "FranckyVincent",
  email: "francky@gmail.com",
  password: "123456"
})

puts 'Creating rums...'
rum1 = Rum.new({
  name: "Le planteur",
  price: 10,
  volume: "1 bouteille",
  description: "Cocktail composé de rhum blanc, de rhum vieux, de sirop de canne, de citron vert, de jus de goyave et jus d'ananas et d'une pointe de cannelle.",
  origin: "Guadeloupe"
})
rum1.remote_photo_url = 'https://www.atelier-cocktail.com/uploads/cocktail-banner/900X471/20150610165340740781.png'
rum1.user = clément
rum1.save!
rum2 = Rum.new({
  name: "Le punch gingembre",
  price: 20,
  volume: "2 bouteilles",
  description: "Avec du sirop naturel et artisanal de gingembre !",
  origin: "Martinique"
})
rum2.remote_photo_url = 'https://boiremixologie.com/files/medias/_imageCarrousel/cocktail-punch-gingembre.jpg'
rum2.user = clément
rum2.save!
rum3 = Rum.new({
  name: "Le ti'punch",
  price: 30,
  volume: "3 bouteilles",
  description: "Un fond de sucre de canne ou de sirop batterie, un doigt de rhum blanc et un zeste de citron vert.",
  origin: "Martinique"
})
rum3.remote_photo_url = 'http://img.facv.pmdstatic.net/fit/http.3A.2F.2Fdata.2Evodemotion.2Ecom.2F31828.2F31828.2Ejpg/1280x720/quality/80/recette-cocktail-le-ti-punch.jpg'
rum3.user = clément
rum3.save!
rum4 = Rum.new({
  name: "Le cuba libre",
  price: 40,
  volume: "4 bouteilles",
  description: "Cocktail à base de rhum, de citron vert et de cola.",
  origin: "Cuba"
})
rum4.remote_photo_url = 'https://www.thecocktailproject.com/sites/default/files/basic-brand-cuba-libre.jpg'
rum4.user = francky
rum4.save!
rum5 = Rum.new({
  name: "Le daiquiri",
  price: 50,
  volume: "5 bouteilles",
  description: "Cocktail composé de rhum blanc, de jus de lime et de sucre.",
  origin: "Brésil"
})
rum5.remote_photo_url = 'https://images.bigcartel.com/product_images/181595999/gastronomista_daiquiri.jpg?auto=format&fit=max&h=1000&w=1000'
rum5.user = francky
rum5.save!
rum6 = Rum.new({
  name: "Le coco bongo",
  price: 60,
  volume: "6 bouteilles",
  description: "Cocktail à base de rhum et de lait de coco.",
  origin: "Martinique"
})
rum6.remote_photo_url = 'https://images.bigcartel.com/product_images/181595999/gastronomista_daiquiri.jpg?auto=format&fit=max&h=1000&w=1000'
rum6.user = francky
rum6.save!
rum7 = Rum.new({
  name: "Petite caresse coco",
  price: 70,
  volume: "7 bouteilles",
  description: "Composé de coco, mais surtout d'Amour.",
  origin: "Guadeloupe"
})
rum7.remote_photo_url = 'https://images.bigcartel.com/product_images/181595999/gastronomista_daiquiri.jpg?auto=format&fit=max&h=1000&w=1000'
rum7.user = francky
rum7.save!

puts 'Creating orders...'
order1 = Order.new({
  quantity: 1,
  status: "en attente"
})
order1.user = jessica
order1.rum = rum1
order1.save!
order2 = Order.new({
  quantity: 2,
  status: "accepté"
})
order2.user = jessica
order2.rum = rum2
order2.save!
order3 = Order.new({
  quantity: 3,
  status: "annulé"
})
order3.user = jessica
order3.rum = rum3
order3.save!
order4 = Order.new({
  quantity: 4,
  status: "refusé"
})
order4.user = jessica
order4.rum = rum4
order4.save!
order5 = Order.new({
  quantity: 5,
  status: "finalisé"
})
order5.user = jessica
order5.rum = rum5
order5.save!
order6 = Order.new({
  quantity: 6,
  status: "en attente"
})
order6.user = francky
order6.rum = rum1
order6.save!
order7 = Order.new({
  quantity: 7,
  status: "en attente"
})
order7.user = francky
order7.rum = rum1
order7.save!

puts 'Creating reviews...'
reviewplanteur1 = Review.new({
  rating: 4,
  content: "J'suis saucé!"
})
reviewplanteur1.user = jeanmich
reviewplanteur1.rum = rum1
reviewplanteur1.save!

reviewplanteur2 = Review.new({
  rating: 1,
  content: "Je n'ai pas reçue la caresse attendue..."
})
reviewplanteur2.user = eveangeli
reviewplanteur2.rum = rum1
reviewplanteur2.save!

reviewplanteur3 = Review.new({
  rating: 4,
  content: "De la qualitay !"
})
reviewplanteur3.user = fruitdelapassion
reviewplanteur3.rum = rum1
reviewplanteur3.save!

reviewplanteur4 = Review.new({
  rating: 5,
  content: "Tu veux mon zizi, oui oui oui oui !"
})
reviewplanteur4.user = francky
reviewplanteur4.rum = rum1
reviewplanteur4.save!


reviewpunchgingembre1 = Review.new({
  rating: 4,
  content: "Au gingembre t'as vu !"
})
reviewpunchgingembre1.user = jeanmich
reviewpunchgingembre1.rum = rum2
reviewpunchgingembre1.save!

reviewpunchgingembre2 = Review.new({
  rating: 1,
  content: "à chier"
})
reviewpunchgingembre2.user = eveangeli
reviewpunchgingembre2.rum = rum2
reviewpunchgingembre2.save!

reviewpunchgingembre3 = Review.new({
  rating: 4,
  content: "J'ai kiffé un truc de ouf"
})
reviewpunchgingembre3.user = fruitdelapassion
reviewpunchgingembre3.rum = rum2
reviewpunchgingembre3.save!

reviewpunchgingembre4 = Review.new({
  rating: 5,
  content: "Fruits de la passion !"
})
reviewpunchgingembre4.user = francky
reviewpunchgingembre4.rum = rum2
reviewpunchgingembre4.save!


reviewtipunch1 = Review.new({
  rating: 4,
  content: "J'me suis mis bien de fou!"
})
reviewtipunch1.user = jeanmich
reviewtipunch1.rum = rum3
reviewtipunch1.save!

reviewtipunch2 = Review.new({
  rating: 1,
  content: "Pas ouf"
})
reviewtipunch2.user = eveangeli
reviewtipunch2.rum = rum3
reviewtipunch2.save!

reviewtipunch3 = Review.new({
  rating: 4,
  content: "C'est un délice!"
})
reviewtipunch3.user = fruitdelapassion
reviewtipunch3.rum = rum3
reviewtipunch3.save!

reviewtipunch4 = Review.new({
  rating: 5,
  content: "Je ne savais pas que c'était ma cousine"
})
reviewtipunch4.user = francky
reviewtipunch4.rum = rum3
reviewtipunch4.save!

reviewcubalibre1 = Review.new({
  rating: 4,
  content: "La vie de chateau wallah"
})
reviewcubalibre1.user = jeanmich
reviewcubalibre1.rum = rum4
reviewcubalibre1.save!

reviewcubalibre2 = Review.new({
  rating: 1,
  content: "Rhum de cassos"
})
reviewcubalibre2.user = eveangeli
reviewcubalibre2.rum = rum4
reviewcubalibre2.save!

reviewcubalibre3 = Review.new({
  rating: 4,
  content: "Au poil !"
})
reviewcubalibre3.user = fruitdelapassion
reviewcubalibre3.rum = rum4
reviewcubalibre3.save!

reviewcubalibre4 = Review.new({
  rating: 5,
  content: "Avec un personnel de merde, qui m'a foutu dans la merde"
})
reviewcubalibre4.user = francky
reviewcubalibre4.rum = rum4
reviewcubalibre4.save!

reviewdaiquiri1 = Review.new({
  rating: 4,
  content: "Achète c'est du bon!"
})
reviewdaiquiri1.user = jeanmich
reviewdaiquiri1.rum = rum5
reviewdaiquiri1.save!

reviewdaiquiri2 = Review.new({
  rating: 1,
  content: "Nul à chier"
})
reviewdaiquiri2.user = eveangeli
reviewdaiquiri2.rum = rum5
reviewdaiquiri2.save!

reviewdaiquiri3 = Review.new({
  rating: 4,
  content: "C'est si doux!"
})
reviewdaiquiri3.user = fruitdelapassion
reviewdaiquiri3.rum = rum5
reviewdaiquiri3.save!

reviewdaiquiri4 = Review.new({
  rating: 5,
  content: "J'aime ton style"
})
reviewdaiquiri4.user = francky
reviewdaiquiri4.rum = rum5
reviewdaiquiri4.save!

reviewcocobongo1 = Review.new({
  rating: 4,
  content: "Putaing c'est beau"
})
reviewcocobongo1.user = jeanmich
reviewcocobongo1.rum = rum6
reviewcocobongo1.save!

reviewcocobongo2 = Review.new({
  rating: 1,
  content: "Jamais autant gerbé de ma vie"
})
reviewcocobongo2.user = eveangeli
reviewcocobongo2.rum = rum6
reviewcocobongo2.save!

reviewcocobongo3 = Review.new({
  rating: 4,
  content: "easy"
})
reviewcocobongo3.user = fruitdelapassion
reviewcocobongo3.rum = rum6
reviewcocobongo3.save!

reviewcocobongo4 = Review.new({
  rating: 5,
  content: "envoi du gras"
})
reviewcocobongo4.user = francky
reviewcocobongo4.rum = rum6
reviewcocobongo4.save!

reviewcoco1 = Review.new({
  rating: 4,
  content: "du paté"
})
reviewcoco1.user = jeanmich
reviewcoco1.rum = rum7
reviewcoco1.save!

reviewcoco2 = Review.new({
  rating: 1,
  content: "je n'achèterai plus jamais sur votre site"
})
reviewcoco2.user = eveangeli
reviewcoco2.rum = rum7
reviewcoco2.save!

reviewcoco3 = Review.new({
  rating: 4,
  content: "je ne vais plus à cawfouw, mais sur votre site"
})
reviewcoco3.user = fruitdelapassion
reviewcoco3.rum = rum7
reviewcoco3.save!

reviewcoco4 = Review.new({
  rating: 5,
  content: "M'a permis d'attraper Madame"
})
reviewcoco4.user = francky
reviewcoco4.rum = rum7
reviewcoco4.save!

puts 'Finished!'
