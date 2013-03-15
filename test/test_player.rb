require 'helper'
require 'fluxx/player'
require 'fluxx/card'

describe Fluxx::Player do
  before do
    @player = Fluxx::Player.new
    @shackles = Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")
    @sloop = Fluxx::Card.create(type: :keeper, name: "Sloop", category: :ship, set: 'Pirate')
  end

  it "can be created with no arguments" do
    @player.hand.must_be_empty
    @player.keepers.must_be_empty
    @player.creepers.must_be_empty
  end

  it "can be given a card" do
    @player.give @sloop
    @player.hand.size.must_equal 1
  end

  it "given a creeper, immediately be played" do
    @player.give @creeper
    @player.hand.size.must_equal 0
    @player.creepers.size.must_equal 0
  end
end
