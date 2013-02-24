require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/card/keeper'

describe Fluxx::Card::Keeper do
  before do
    @treasure_chest = Fluxx::Card.create(type: :goal,
                                         name: "Treasure Chest",
                                         set:  'Pirate',
                                         goal: { cards:["Strongbox"], booty:2 })

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

end

