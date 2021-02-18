require "open-uri"

Booking.destroy_all
Equipment.destroy_all
User.destroy_all

nico = User.new(first_name: "Nicolas", last_name: "Gauguez", email:"nico@xtrem.com", password:"password")
nico.save!

puts 'Creating equipments...'
freeride = URI.open("https://images.cdn.snowleader.com/media/catalog/product/cache/1/image/0dc2d03fe217f8c83829496872af24a0/q/s/qst_99_dark_blue_2020-configurable-salomon-salo04501.jpg")
salomon_freeride = Equipment.new(title: "Ski Salomon freeride 2m", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: expert", address: "Serre Chevalier", daily_price: 25, user: nico, sport_category: 'Ski')
salomon_freeride.photo.attach(io: freeride, filename: 'image.png', content_type: 'image/png')
salomon_freeride.save!

atomic = URI.open("https://images.blue-tomato.com/is/image/bluetomato/304061851_front.jpg-bi6IsiGKDPth_aMNQ_9Ie6aOIWU/uni.jpg?$m4$")
atomic_freeride = Equipment.new(title: "Ski atomic_freeride 1m70", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: beginner", address: "Megeve", daily_price: 15, user: nico, sport_category: 'Ski')
atomic_freeride.photo.attach(io: atomic, filename: 'image.png', content_type: 'image/png')
atomic_freeride.save!

salomon = URI.open("https://www.extremevital.com/catalog/images/salomon/2019/tnt_2019_1_l.jpg")
salomon_freestyle = Equipment.new(title: "Ski Salomon freestyle 1m80", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: beginner", address: "Grenoble", daily_price: 29, user: nico, sport_category: 'Ski')
salomon_freestyle.photo.attach(io: salomon, filename: 'image.png', content_type: 'image/png')
salomon_freestyle.save!

atomic_free = URI.open("https://www.extremevital.com/catalog/images/salomon/2019/tnt_2019_1_l.jpg")
atomic_freestyle = Equipment.new(title: "Ski ATOMIC", description: "Enjoy the puff this weekend with my skis. Brand new, 2017. Level: expert", address: "La plagne", daily_price: 10, user: nico, sport_category: 'Ski')
atomic_freestyle.photo.attach(io: atomic_free, filename: 'image.png', content_type: 'image/png')
atomic_freestyle.save!

black = URI.open("https://www.sports-aventure.fr/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/b/l/black_crows_atris_2019_2.jpg")
black_crows = Equipment.new(title: "Ski black crows 2m", description: "Enjoy the puff this weekend with my skis. Brand new, 2019. Level: pro", address: "Chamonix", daily_price: 30, user: nico, sport_category: 'Ski')
black_crows.photo.attach(io: black, filename: 'image.png', content_type: 'image/png')
black_crows.save!

rossi = URI.open("https://www.precisionski.fr/68970-zoom_popin/pack-ski-rossignol-experience-84ai-w-xp-w11-gw.jpg")
rossignol = Equipment.new(title: "Ski Rossignol!!!", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: expert", address: "Courmayeur", daily_price: 15, user: nico, sport_category: "Ski")
rossignol.photo.attach(io: rossi, filename: 'image.png', content_type: 'image/png')
rossignol.save!

rossi = URI.open("https://www.precisionski.fr/68970-zoom_popin/pack-ski-rossignol-experience-84ai-w-xp-w11-gw.jpg")
rossignol = Equipment.new(title: "Ski Rossignol!!!", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: expert", address: "Londres", daily_price: 15, user: nico, sport_category: "Ski")
rossignol.photo.attach(io: rossi, filename: 'image.png', content_type: 'image/png')
rossignol.save!

rossi = URI.open("https://www.precisionski.fr/68970-zoom_popin/pack-ski-rossignol-experience-84ai-w-xp-w11-gw.jpg")
rossignol = Equipment.new(title: "Ski Rossignol!!!", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: expert", address: "Rome", daily_price: 15, user: nico, sport_category: "Ski")
rossignol.photo.attach(io: rossi, filename: 'image.png', content_type: 'image/png')
rossignol.save!

rossi = URI.open("https://www.precisionski.fr/68970-zoom_popin/pack-ski-rossignol-experience-84ai-w-xp-w11-gw.jpg")
rossignol = Equipment.new(title: "Ski Rossignol!!!", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: expert", address: "Berlin", daily_price: 15, user: nico, sport_category: "Ski")
rossignol.photo.attach(io: rossi, filename: 'image.png', content_type: 'image/png')
rossignol.save!

rossi = URI.open("https://www.precisionski.fr/68970-zoom_popin/pack-ski-rossignol-experience-84ai-w-xp-w11-gw.jpg")
rossignol = Equipment.new(title: "Ski Rossignol!!!", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: expert", address: "Lille", daily_price: 15, user: nico, sport_category: "Ski")
rossignol.photo.attach(io: rossi, filename: 'image.png', content_type: 'image/png')
rossignol.save!

rossi = URI.open("https://www.precisionski.fr/68970-zoom_popin/pack-ski-rossignol-experience-84ai-w-xp-w11-gw.jpg")
rossignol = Equipment.new(title: "Ski Rossignol!!!", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: expert", address: "Barcelone", daily_price: 15, user: nico, sport_category: "Ski")
rossignol.photo.attach(io: rossi, filename: 'image.png', content_type: 'image/png')
rossignol.save!
