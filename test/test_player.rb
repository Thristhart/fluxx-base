require 'helper'
require 'fluxx/player'
require 'fluxx/card'
require 'fluxx/library'

describe Fluxx::Player do
  before do
    @player = Fluxx::Player.new
    @shackles = Fluxx::Library["Shackles"]
    @sloop = Fluxx::Library["Sleoop"]
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
