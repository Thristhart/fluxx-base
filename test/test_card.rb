require 'helper'
require 'fluxx/card'
require 'fluxx/ruleset'
require 'fluxx/player'
require 'fluxx/library'

describe Fluxx::Card do
  describe "Fully described card" do
    before do
      @shackles = Fluxx::Library["Shackles"]

      @game = Fluxx::Game.new
      @ruleset = @game.ruleset
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
      @shackles.set.must_equal :pirate
    end

    it "returns the given description" do
      @shackles.description.must_equal "You can't win if you have this unless the Goal says otherwise."
    end

    it "can be played" do
      @shackles.must_respond_to :play

      @shackles.play(@ruleset, @player)
      @player.creepers.must_include @shackles
    end

    it "can be sorted alphabetically" do
      (Fluxx::Library['Sloop'] <=> @shackles).must_equal 1
      (Fluxx::Library['Minimal'] <=> @shackles).must_equal -1
      (@shackles <=> @shackles).must_equal 0

      [@shackles, Fluxx::Library['Sloop'], Fluxx::Library['Minimal']].sort.must_equal [Fluxx::Library['Minimal'], @shackles, Fluxx::Library['Sloop']]
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
    Fluxx::Library['Minimal'].set.must_equal 'Fluxx'
  end

  it "optionally has a description" do
    Fluxx::Library['Minimal'].description.must_be_nil
  end


end
