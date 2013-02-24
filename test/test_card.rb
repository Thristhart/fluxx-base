require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/card'

describe Fluxx::Card do
  before do
    @shackles = Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")

    @treasure_chest = Fluxx::Card.create(type: :goal, name: "Treasure Chest", set: 'Pirate', goal: { cards:["Strongbox"], booty:2 })

    @ruleset = Ruleset.new
    @player = Player.new
  end

  it "is of the correct class" do
    @shackles.must_be_kind_of Fluxx::Card
    @treasure_chest.must_be_kind_of Fluxx::Card

    @shackles.must_be_instance_of Fluxx::Card::Creeper
    @treasure_chest.must_be_instance_of Fluxx::Card::Goal
  end

  it "has a name" do
    @shackles.name.must_equal "Shackles"
    @treasure_chest.name.must_equal "Treasure Chest"
  end

  it "has a set" do
    @shackles.set.must_equal "Pirate"
    @treasure_chest.set.must_equal "Pirate"
  end

  it "has a description" do
    @shackles.description.must_equal "You can't win if you have this unless the Goal says otherwise."
    @treasure_chest.description.must_equal ""
  end

  it "has no player" do
    @shackles.player.must_be_null
    @treasure_chest.player.must_be_null
  end

  it "can be played" do
    @shackles.must_respond_to :play
    @treasure_chest.must_respond_to :play

    @shackles.play(@ruleset, @player)
    @player.creepers.must_include @shackles

    @treasure_chest.play(@ruleset, @player)
    @ruleset.goals.must_include @treasure_chest
  end

end
