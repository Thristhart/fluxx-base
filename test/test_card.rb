require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/card'

describe Fluxx::Card do
  before do
    @shackles = Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")

    # A keeper with nothing special
    @sloop = Fluxx::Card.create(type: :keeper, name: "Sloop", category: :ship, set: 'Pirate')

    # The captain's hat! Arr, 'matey!
    @captain_hat = Fluxx::Card.create(type: :keeper, name: "Captain's Hat", set: 'Pirate', description: "Players must call you Captain.") do |rules, player|
      player.title << "Captain"
      rules.special[:captain] = player
    end

    @treasure_chest = Fluxx::Card.create(type: :goal, name: "Treasure Chest", set: 'Pirate', goal:{cards:["Strongbox"], booty:2})

    @ruleset = Ruleset.new
    @player = Player.new
  end

  it "is of the correct class" do
    @shackles.must_be_kind_of Fluxx::Card
    @sloop.must_be_kind_of Fluxx::Card
    @captain_hat.must_be_kind_of Fluxx::Card
    @treasure_chest.must_be_kind_of Fluxx::Card

    @shackles.must_be_instance_of Fluxx::Card::Creeper
    @sloop.must_be_instance_of Fluxx::Card::Keeper
    @captain_hat.must_be_instance_of Fluxx::Card::Keeper
    @treasure_chest.must_be_instance_of Fluxx::Card::Goal
  end

  it "has a name" do
    @shackles.name.must_equal "Shackles"
    @sloop.name.must_equal "Sloop"
    @captain_hat.name.must_equal "Captain's Hat"
    @treasure_chest.name.must_equal "Treasure Chest"
  end

  it "has a set" do
    @shackles.set.must_equal "Pirate"
    @sloop.set.must_equal "Pirate"
    @captain_hat.set.must_equal "Pirate"
    @treasure_chest.set.must_equal "Pirate"
  end

  it "has a description" do
    @shackles.description.must_equal "You can't win if you have this unless the Goal says otherwise."
    @sloop.description.must_equal ""
    @captain_hat.description.must_equal "Players must call you Captain."
    @treasure_chest.description.must_equal ""
  end

  it "has no player" do
    @shackles.player.must_be_null
    @sloop.player.must_be_null
    @captain_hat.player.must_be_null
    @treasure_chest.player.must_be_null
  end

  it "can be played" do
    @shackles.must_respond_to :play
    @sloop.must_respond_to :play
    @captain_hat.must_respond_to :play
    @treasure_chest.must_respond_to :play

    @shackles.play(@ruleset, @player)
    @player.creepers.must_include @shackles

    @sloop.play(@ruleset, @player)
    @player.keepers.must_include @sloop

    @captain_hat.play(@ruleset, @player)
    @player.keepers.must_include @captain_hat
    @player.title.must_include "Captain"
    @ruleset.special[:captain].wont_be_null

    @treasure_chest.play(@ruleset, @player)
    @ruleset.goals.must_include @treasure_chest

  end

end
