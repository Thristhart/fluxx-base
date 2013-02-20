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
    @shackles.is_a Fluxx::Card::Creeper
    @sloop.is_a Fluxx::Card::Keeper
    @captain_hat.is_a Fluxx::Card::Keeper
    @treasure_chest.is_a Fluxx::Card::Goal
  end

  it "should have a name" do
    @shackles.name == "Shackles"
    @sloop.name == "Sloop"
    @captain_hat.name == "Captain's Hat"
    @treasure_chest.name == "Treasure Chest"
  end

  it "should have a set" do
    @shackles.set == "Pirate"
    @sloop.set == "Pirate"
    @captain_hat.set == "Pirate"
    @treasure_chest.set == "Pirate"
  end
end
