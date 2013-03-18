require 'helper'
require 'fluxx/card/keeper'
require 'fluxx/player'
require 'fluxx/ruleset'
require 'fluxx/library'

describe Fluxx::Card::Keeper do
  before do
    # A keeper with nothing special
    @sloop = Fluxx::Library["Sloop"]

    @player = Fluxx::Player.new
    @ruleset = Fluxx::Ruleset.new
  end

  it "should be of the correct class" do
    @sloop.must_be_kind_of Fluxx::Card
    @sloop.must_be_instance_of Fluxx::Card::Keeper
  end

  it "should have a defined category" do
    @sloop.category.must_be :ship
  end

  it "should go to a player's keepers when played" do
    @sloop.play(@ruleset, @player)

    @player.keepers.must_include @sloop
  end

  it "can be played" do
    @sloop.play(@ruleset, @player)
    @player.keepers.must_include @sloop
  end
end
