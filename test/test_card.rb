require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/card'

describe Fluxx::Card do
  before do
    @shackles = Fluxx::Card.create(:creeper, "Shackles", "You can't win if you have this unless the Goal says otherwise.") do |rules, player|
      player.creepers << self
    end

    # A keeper with nothing special
    @sloop = Fluxx::Card.create(type: :keeper, name: "Sloop", category: :ship, set: 'Pirate')

    # The captain's hat! Arr, 'matey!
    @captain_hat = Fluxx::Card.create(type: :keeper, name: "Captain's Hat", set: 'Pirate') do |rules, player|
      player.title << "Captain"
      rules.special[:captain] = player
    end

    @treasure_chest = Fluxx::Card.create(type: :goal, name: "Treasure Chest", set: 'Pirate') do |player|
      player.keepers.include Fluxx::Card["Strongbox"] && player.keepers.select{|card| card.is_a? :booty}.length > 2
    end
  end

  it "should be of the correct class" do
    @shackles.must_be_kind_of Fluxx::Card
    @sloop.must_be_kind_of Fluxx::Card
    @captain_hat.must_be_kind_of Fluxx::Card
    @treasure_chest.must_be_kind_of Fluxx::Card

    @shackles.must_be_instance_of Fluxx::Card::Creeper
    @sloop.must_be_instance_of Fluxx::Card::Keeper
    @captain_hat.must_be_instance_of Fluxx::Card::Keeper
    @treasure_chest.must_be_instance_of Fluxx::Card::Goal
  end

  it "should have a name" do
    @shackles.name.must_equal "Shackles"
    @sloop.name.must_equal "Sloop"
    @captain_hat.name.must_equal "Captain's Hat"
    @treasure_chest.name.must_equal "Treasure Chest"
  end

  it "should have a set" do
    @shackles.set.must_equal "Pirate"
    @sloop.set.must_equal "Pirate"
    @captain_hat.set.must_equal "Pirate"
    @treasure_chest.set.must_equal "Pirate"
  end
end
