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

  it "can be created empty" do
    @player.hand.must_be_empty
    @player.keepers.must_be_empty
    @player.creepers.must_be_empty
  end

  it "can be given a card" do
    @player.give @sloop
    @player.hand.must_equal [@sloop]
  end

  it "can be given many cards" do
    @player.give @sloop
    @player.give @shackles
    @player.hand.must_equal [@sloop, @shackles]
  end

  it "given a creeper which will be immediately played" do
    @player.give @creeper
    @player.hand.size.must_equal 0
    @player.creepers.size.must_equal 0
  end

  # Idempotent, baby!
  it "can only be given a card once" do
    @player.give @sloop
    # Re-using this exception might be confusing, or not. *Shrugs*
    proc { @player.give @sloop }.must_raise Fluxx::CardAlreadyExistsError
    @player.hand.must_equal [@sloop]
  end
end
