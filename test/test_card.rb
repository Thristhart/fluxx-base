require 'helper'
require 'fluxx/card'

describe Fluxx::Card do
  describe "Fully described card" do
    before do
      @shackles = Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.", set: 'Pirate')

      @ruleset = Fluxx::Ruleset.new
      @player = Fluxx::Player.new
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

    it "returns the given description" do
      @shackles.description.must_equal "You can't win if you have this unless the Goal says otherwise."
    end

    it "can be played" do
      @shackles.must_respond_to :play

      @shackles.play(@ruleset, @player)
      @player.creepers.must_include @shackles
    end
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

  it "has a default set if no other is specified" do
    Fluxx::Card.create(type: :rule, name: "Play 2").set.must_equal 'Fluxx'
  end

  it "optionally has a description" do
    Fluxx::Card.create(type: :rule, name: "Play 2").description.must_be_nil
  end
end
