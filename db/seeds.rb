Equipment.destroy_all
User.destroy_all



nico = User.new(first_name: "Nicolas", last_name: "Gauguez", email:"nico@xtrem.com", password:"password")
nico.save!

puts 'Creating equipments...'
salomon_freeride = Equipment.new(title: "Ski Salomon freeride 2m", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: expert", address: "Serre Chevalier", daily_price: 25, user: nico, sport_category: 'Ski')
salomon_freeride.save!

atomic_freeride = Equipment.new(title: "Ski atomic_freeride 1m70", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: beginner", address: "Megeve", daily_price: 15, user: nico, sport_category: 'Ski')
atomic_freeride.save!

salomon_freestyle = Equipment.new(title: "Ski Salomon freestyle 1m80", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: beginner", address: "Grenoble", daily_price: 29, user: nico, sport_category: 'Ski')
salomon_freestyle.save!

atomic_freestyle = Equipment.new(title: "Ski ATOMIC", description: "Enjoy the puff this weekend with my skis. Brand new, 2017. Level: expert", address: "La plagne", daily_price: 10, user: nico, sport_category: 'Ski')
atomic_freestyle.save!

black_crows = Equipment.new(title: "Ski black crows 2m", description: "Enjoy the puff this weekend with my skis. Brand new, 2019. Level: pro", address: "Chamonix", daily_price: 30, user: nico, sport_category: 'Ski')
black_crows.save!

rossignol = Equipment.new(title: "Ski Rossignol!!!", description: "Enjoy the puff this weekend with my skis. Brand new, 2021. Level: expert", address: "Courmayeur", daily_price: 15, user: nico, sport_category: "Ski")
rossignol.save!
