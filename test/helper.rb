require 'simplecov'
SimpleCov.start

require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/library'

# An example card that includes a category requirement
Fluxx::Card.create(type: :goal,
                   name: "Treasure Chest",
                   set:  'Pirate',
                   goal: { cards:["Strongbox"], booty:2 })

# The only goal in the entire Pirate set that contains an 'or'
Fluxx::Card.create(type: :goal,
                   name: "Munitions",
                   set:  'Pirate',
                   goal: { either: ["Flintlock Pistol", "Cannon"], cards:["Gunpowder"] })

# A fairly basic goal
Fluxx::Card.create(type: :goal,
                   name: "Key Lime Pie",
                   set:  'Pirate',
                   goal: { cards: ["Key", "Limes"] })

# This one requires a subset of cards
Fluxx::Card.create(type: :goal,
                   name: "Gems",
                   set:  'Pirate',
                   goal: { needs: [3, "Rubies", "Pearls", "Diamonds", "Emeralds"] })


Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")

Fluxx::Card.create(type: :rule, name: 'Play 4', description: 'Play 4 cards') do |rules, player|
  rules.play_limit = 4
end
Fluxx::Card.create(type: :rule, name: 'Play 2', description: 'Play 2 cards') do |rules, player|
  rules.play_limit = 2
end
Fluxx::Card.create(type: :rule, name: 'Play All', description: 'Play all cards in your hand') do |rules, player|
  rules.play_limit = 0
end
