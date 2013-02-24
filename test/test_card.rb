require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/card'

describe Fluxx::Card do
  before do
    @shackles = Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")

    @ruleset = Ruleset.new
    @player = Player.new
  end

  it "is of the correct class" do
    @shackles.must_be_kind_of Fluxx::Card

    @shackles.must_be_instance_of Fluxx::Card::Creeper
  end

  it "has a name" do
    @shackles.name.must_equal "Shackles"
  end

  it "has a set" do
    @shackles.set.must_equal "Pirate"
  end

  it "has a description" do
    @shackles.description.must_equal "You can't win if you have this unless the Goal says otherwise."
  end

  it "has no player" do
    @shackles.player.must_be_null
  end

  it "can be played" do
    @shackles.must_respond_to :play

    @shackles.play(@ruleset, @player)
    @player.creepers.must_include @shackles
  end

  it "must have a name or error" do
    proc {
      Fluxx::Card.create(type: :goal,
                         set:  'Pirate')
    }.must_raise Fluxx::MissingAttributeError
  end

  it "must have a type or error" do
    proc {
      Fluxx::Card.create(name: "Shackles",
                         set:  'Pirate')
    }.must_raise Fluxx::MissingAttributeError
  end

  it "doesn't need a set" do
    # since we don't define a set in the before, we can use it in this test
    @shackles.set.must_equal :fluxx
  end
end
