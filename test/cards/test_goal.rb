require 'helper'
require 'fluxx/card/keeper'
require 'fluxx/player'
require 'fluxx/ruleset'

describe Fluxx::Card::Keeper do
  before do
    # An example card that includes a category requirement
    @treasure_chest = Fluxx::Card.create(type: :goal,
                                         name: "Treasure Chest",
                                         set:  'Pirate',
                                         goal: { cards:["Strongbox"], booty:2 })

    # The only goal in the entire Pirate set that contains an 'or'
    @munitions = Fluxx::Card.create(type: :goal,
                                    name: "Munitions",
                                    set:  'Pirate',
                                    goal: { either: ["Flintlock Pistol", "Cannon"], cards:["Gunpowder"] })

    # A fairly basic goal
    @key_lime_pie = Fluxx::Card.create(type: :goal,
                                       name: "Key Lime Pie",
                                       set:  'Pirate',
                                       goal: { cards: ["Key", "Limes"] })

    # This one requires a subset of cards
    @gems = Fluxx::Card.create(type: :goal,
                               name: "Gems",
                               set:  'Pirate',
                               goal: { needs: [3, "Rubies", "Pearls", "Diamonds", "Emeralds"] })

    @player = Fluxx::Player.new
    @ruleset = Fluxx::Ruleset.net
  end

  it "should be of the correct class" do
    @treasure_chest.must_be_kind_of Fluxx::Card
    @treasure_chest.must_be_instance_of Fluxx::Card::Keeper
  end

  it "should have no default category" do
    @captain_hat.category == nil
  end

  it "should have a defined category" do
    @sloop.category == :ship
  end

  it "should respond to special" do
    @sloop.respond_to? :special
  end

  it "should define the new goal" do
    @treasure_chest.play(@ruleset, @player)

    @ruleset.criteria.must_equal @treasure_chest.goal
  end

  it "requires a goal to be defined" do
    proc { 
      Fluxx::Card.create(type: :goal,
                         name: "Gems",
                         set:  'Pirate')
    }.must_raise Fluxx::MissingAttributeError
  end


end

