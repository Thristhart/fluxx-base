# A bunch of cards, pulled from the Pirate version

require 'fluxx/card'

# {{{ Keepers
Fluxx::Card.create(type: :keeper, name: "Cannon", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Diamonds", category: :booty, set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Dinghy", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Emeralds", category: :booty, set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Gunpowder", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Jolly Roger", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Keg", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Limes", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Monkey", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Oranges", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Parrot", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Pearls", category: :booty, set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Royal Colors", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Rubies", category: :booty, set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Rum", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Strongbox", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Key", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Treasure Map", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Tropical Island", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Captain's Hat", set: :pirate, description: "If you have this on the table, all other players must call you the Captain.")
#If you have this on the table, no one can Plunder from you unless they have the Flintlock Pistol or the Captain's Hat on the table.
Fluxx::Card.create(type: :keeper, name: "Cutlass", set: :pirate)
#If you have this on the table, no one can Plunder from you unless they have the Captain's Hat on the table.
Fluxx::Card.create(type: :keeper, name: "Flintlock Pistol", set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Frigate", category: :ship, set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Galleon", category: :ship, set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Gold Doubloons", category: :booty, set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Pieces of Eight", category: :booty, set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Schooner", category: :ship, set: :pirate)
Fluxx::Card.create(type: :keeper, name: "Sloop", category: :ship, set: :pirate)
# }}}

# {{{ Goals
Fluxx::Card.create(type: :goal, name: "Armada", description: "The player who has at least 3 of the following Keepers on the table wins: Sloop, Schooner, Galleon, Frigate", goal: { needs: [3, "Sloop", "Schooner", "Galleon", "Frigate"] }, set: :pirate)
#Fluxx::Card.create(type: :goal, name: "Free the Prisoner!", description: "The player who has the Key and Shackles on the table wins.", set: :pirate, goal: {cards: ["Key", "Shackle"]})
Fluxx::Card.create(type: :goal, name: "Fresh Fruit", description: "The player who has Limes and Oranges on the table wins.", set: :pirate, goal: {cards: ["Limes", "Oranges"]})
Fluxx::Card.create(type: :goal, name: "Gems", description: "The player who has at least 3 of the following Keepers on the table wins: Rubies, Pearls, Diamonds, Emeralds.", set: :pirate, goal: { needs: [3, "Rubies", "Pearls", "Diamonds", "Emeralds"] })
Fluxx::Card.create(type: :goal, name: "Keg of Rum", description: "The player who has the Keg and Rum on the table wins.", set: :pirate, goal: {cards: ["Keg", "Rum"]})
Fluxx::Card.create(type: :goal, name: "Key Lime Pie", description: "The player who has the Key and Limes on the table wins.", set: :pirate, goal: {cards: ["Key", "Limes"]})
Fluxx::Card.create(type: :goal, name: "Marooned", description: "The player who has the Tropical Island and the Dinghy on the table wins.", set: :pirate, goal: {cards: ["Tropical Island", "Dinghy"]})
Fluxx::Card.create(type: :goal, name: "Pirate Pets", description: "The player who has the Monkey and the Parrot on the table wins.", set: :pirate, goal: {cards: ["Monkey", "Parrot"]})
Fluxx::Card.create(type: :goal, name: "Powder Keg", description: "The player who has Gunpowder and the Keg on the table wins.", set: :pirate, goal: {cards: ["Gunpowder", "Keg"]})
Fluxx::Card.create(type: :goal, name: "Powder Monkey", description: "The player who has Gunpowder and the Monkey on the table wins.", set: :pirate, goal: {cards: ["Gunpowder", "Monkey"]})
Fluxx::Card.create(type: :goal, name: "Privateers", description: "The player who has Royal Colors and the Jolly Roger on the table wins.", set: :pirate, goal: {cards: ["Royal Colors", "Jolly Roger"]})
Fluxx::Card.create(type: :goal, name: "Shallow Seas", description: "The player who has the Dinghy and the Sloop on the table wins.", set: :pirate, goal: {cards: ["Dinghy", "Sloop"]})
Fluxx::Card.create(type: :goal, name: "Sword & Pistol", description: "The player who has the Cutlass and the Flintlock Pistol on the table wins.", set: :pirate, goal: {cards: ["Cutlass", "Flintlock Pistol"]})
Fluxx::Card.create(type: :goal, name: "The Captain's Parrot", description: "The player who has the Captain's Hat and the Parrot on the table wins.", goal: {cards: ["Captain's Hat", "Parrot"]}, set: :pirate)
Fluxx::Card.create(type: :goal, name: "Unlock the Box", description: "The player who has the Key and the Strongbox on the table wins.", set: :pirate, goal: {cards: ["Key", "Strongbox"]})
Fluxx::Card.create(type: :goal, name: "Yo Ho Ho & a Bottle of Rum", description: "The player who has the Jolly Roger and Rum on the table wins.", set: :pirate, goal: {cards: ["Jolly Roger", "Rum"]})
Fluxx::Card.create(type: :goal, name: "Munitions", description: "The player who has the Gunpowder and either the Flintlock Pistol or the Cannon on the table wins.", set: :pirate, goal: { either: ["Flintlock Pistol", "Cannon"], cards:["Gunpowder"] })
Fluxx::Card.create(type: :goal, name: "Treasure Chest", description: "The player who has at least 2 Booty Keepers and the Strongbox on the table wins.", set: :pirate, goal: {booty: 2, cards: ["Strongbox"]})
Fluxx::Card.create(type: :goal, name: "Treasure Ship", description: "The player who has at least 2 Booty Keepers and the Galleon on the table wins.", set: :pirate, goal: {booty: 2, cards: ["Galleon"]})
Fluxx::Card.create(type: :goal, name: "Land Ho!", description: "The player who has the Tropical Island and at least 1 Ship Keeper on the table wins.", set: :pirate, goal: {ship: 1, cards: ["Tropical Island"]})
Fluxx::Card.create(type: :goal, name: "Gold and Silver", description: "The player who has Gold Doubloons and Pieces of Eight on the table wins.", set: :pirate, goal: {cards: ["Gold Doubloons", "Pieces of Eight"]})
Fluxx::Card.create(type: :goal, name: "Pirate Ship", description: "The player who has at least 1 Ship and the Jolly Roger on the table wins.", set: :pirate, goal: {ship: 1, cards: ["Jolly Roger"]})
Fluxx::Card.create(type: :goal, name: "Royal Navy Ship", description: "The player who has at least 1 Ship and the Royal Colors on the table wins.", set: :pirate, goal: {ship: 1, cards: ["Royal Colors"]})
Fluxx::Card.create(type: :goal, name: "Run Out the Guns!", description: "The player who has the Cannon and at least 1 Ship Keeper on the table wins.", set: :pirate, goal: {cards: ["Cannon"], ship: 1})
Fluxx::Card.create(type: :goal, name: "X Marks the Spot", description: "The player who has the Treasure Map and the Tropical Island on the table wins.", set: :pirate, goal: {cards: ["Treasure Map", "Tropical Island"]})
# }}}

# {{{ Rules
Fluxx::Card.create(type: :rule, name: "Draw 2", description: "Draw 2 cards per turn. The person who played this card should draw extra cards right away (if needed) so that they have drawn 2 cards this turn.", set: :pirate, modifier: :draw_count, new: 2)
Fluxx::Card.create(type: :rule, name: "Draw 3", description: "Draw 3 cards per turn. The person who played this card should draw extra cards right away (if needed) so that they have drawn 3 cards this turn.", set: :pirate, modifier: :draw_count, new: 3)
Fluxx::Card.create(type: :rule, name: "Draw 4", description: "Draw 4 cards per turn. The person who played this card should draw extra cards right away (if needed) so that they have drawn 4 cards this turn.", set: :pirate, modifier: :draw_count, new: 4)
Fluxx::Card.create(type: :rule, name: "Draw 5", description: "Draw 5 cards per turn. The person who played this card should draw extra cards right away (if needed) so that they have drawn 5 cards this turn.", set: :pirate, modifier: :draw_count, new: 5)
Fluxx::Card.create(type: :rule, name: "Hand Limit 1", description: "If it isn't your turn, you can only have 1 card in your hand - discard your choice of extras immediately. During your turn, this rule does not apply to you; when your turn is over, discard down to 1 card.", set: :pirate, modifier: :hand_limit, new: 1)
Fluxx::Card.create(type: :rule, name: "Hand Limit 2", description: "If it isn't your turn, you can only have 2 cards in your hand - discard your choice of extras immediately. During your turn, this rule does not apply to you; when your turn is over, discard down to 2 cards.", set: :pirate, modifier: :hand_limit, new: 2)
Fluxx::Card.create(type: :rule, name: "Hand Limit 3", description: "If it isn't your turn, you can only have 3 cards in your hand - discard your choice of extras immediately. During your turn, this rule does not apply to you; when your turn is over, discard down to 3 cards.", set: :pirate, modifier: :hand_limit, new: 3)
Fluxx::Card.create(type: :rule, name: "Hand Limit 4", description: "If it isn't your turn, you can only have 4 cards in your hand - discard your choice of extras immediately. During your turn, this rule does not apply to you; when your turn is over, discard down to 4 cards.", set: :pirate, modifier: :hand_limit, new: 4)
Fluxx::Card.create(type: :rule, name: "Keeper Limit 2", description: "Except during your turn, you can only have 2 Keepers in play. Discard extras (of your choice) immediately. You may play new Keepers during your turn as long as you discard to 2 when your turn ends.", set: :pirate, modifier: :keeper_limit, new: 2)
Fluxx::Card.create(type: :rule, name: "Keeper Limit 3'", description: "Except during your turn, you can only have 3 Keepers in play. Discard extras (of your choice) immediately. You may play new Keepers during your turn as long as you discard to 3 when your turn ends.", set: :pirate, modifier: :keeper_limit, new: 3)
Fluxx::Card.create(type: :rule, name: "Keeper Limit 4", description: "Except during your turn, you can only have 4 Keepers in play. Discard extras (of your choice) immediately. You may play new Keepers during your turn as long as you discard to 4 when your turn ends.", set: :pirate, modifier: :keeper_limit, new: 4)
Fluxx::Card.create(type: :rule, name: "Play 2", description: "Play 2 cards per turn. If you have fewer than 2 cards in your hand, play all your cards.", set: :pirate, modifier: :play_limit, new: 2)
Fluxx::Card.create(type: :rule, name: "Play 3", description: "Play 3 cards per turn. If you have fewer than 3 cards in your hand, play all your cards.", set: :pirate, modifier: :play_limit, new: 3)
Fluxx::Card.create(type: :rule, name: "Play 4", description: "Play 4 cards per turn. If you have fewer than 4 cards in your hand, play all your cards.", set: :pirate, modifier: :play_limit, new: 4)
Fluxx::Card.create(type: :rule, name: "Play All", description: "Play all of the cards in your hand on each turn.", set: :pirate, modifier: :play_limit, new: 0)
# }}}

# vim: set fdm=marker:
