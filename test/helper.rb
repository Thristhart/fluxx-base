require 'simplecov'
SimpleCov.start

require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/library'

# Remove any cards the library itself loads, only use the ones we define below,
# for testing purposes.
Fluxx::Library.clear!

# Pretty basic keepers, that has a category. NB: These need to be defined before
# the goals, to make sure the criteria solving code succeeds.
Fluxx::Card.create(type: :keeper, name: 'Sloop', set: :pirate, category: :ship)
Fluxx::Card.create(type: :keeper, name: 'Strongbox')
Fluxx::Card.create(type: :keeper, name: 'Flintlock Pistol')
Fluxx::Card.create(type: :keeper, name: 'Cannon')
Fluxx::Card.create(type: :keeper, name: 'Gunpowder')
Fluxx::Card.create(type: :keeper, name: 'Key')
Fluxx::Card.create(type: :keeper, name: 'Limes')
Fluxx::Card.create(type: :keeper, name: 'Rubies', catgeory: :booty)
Fluxx::Card.create(type: :keeper, name: 'Pearls', catgeory: :booty)
Fluxx::Card.create(type: :keeper, name: 'Diamonds', catgeory: :booty)
Fluxx::Card.create(type: :keeper, name: 'Emeralds', catgeory: :booty)

# An example card that includes a category requirement
Fluxx::Card.create(type: :goal,
                   name: "Treasure Chest",
                   set:  :pirate,
                   goal: { cards:["Strongbox"], booty:2 })

# The only goal in the entire Pirate set that contains an 'or'
Fluxx::Card.create(type: :goal,
                   name: "Munitions",
                   set:  :pirate,
                   goal: { either: ["Flintlock Pistol", "Cannon"], cards:["Gunpowder"] })

# A fairly basic goal
Fluxx::Card.create(type: :goal,
                   name: "Key Lime Pie",
                   set:  :pirate,
                   goal: { cards: ["Key", "Limes"] })

# This one requires a subset of cards
Fluxx::Card.create(type: :goal,
                   name: "Gems",
                   set:  :pirate,
                   goal: { needs: [3, "Rubies", "Pearls", "Diamonds", "Emeralds"] })

Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.", set: :pirate)

Fluxx::Card.create(type: :rule, name: 'Draw 4', description: 'Draw 4 cards', mod: :draw_limit, new: 4)
Fluxx::Card.create(type: :rule, name: 'Draw 2', description: 'Draw 2 cards', mod: :draw_limit, new: 2)
Fluxx::Card.create(type: :rule, name: 'Play 4', description: 'Play 4 cards', mod: :play_limit, new: 4)
Fluxx::Card.create(type: :rule, name: 'Play 2', description: 'Play 2 cards', mod: :play_limit, new: 2)
Fluxx::Card.create(type: :rule, name: 'Play All', description: 'Play all cards', mod: :play_limit, new: 0)

# The most basic card, ever. No description, no set, nothing special at all.
Fluxx::Card.create(type: :keeper, name: 'Minimal')
