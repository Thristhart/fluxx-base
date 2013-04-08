require 'helper'
require 'fluxx/card/keeper'
require 'fluxx/player'
require 'fluxx/ruleset'
require 'fluxx/library'

describe Fluxx::Card::Rule do
  before do
    @play_2 = Fluxx::Library["Play 2"]
    @play_4 = Fluxx::Library["Play 4"]

    @player = Fluxx::Player.new
    @game = Fluxx::Game.new
    @ruleset = @game.ruleset
  end

  it "should define a new rule" do
    @player.play @play_2, @ruleset

    @ruleset.play_limit.must_equal 2
  end

  it "must have a modifier and value" do
    proc {
      Fluxx::Card.create(type: :rule,
                         name: 'Play 9',
                         description: 'Invalid: Play 9 cards',
                         modifier: :play_limit)
    }.must_raise Fluxx::MissingAttributeError

    proc {
      Fluxx::Card.create(type: :rule,
                         name: 'Play 9',
                         description: 'Invalid: Play 9 cards',
                         new: 9)
    }.must_raise Fluxx::MissingAttributeError
  end

  it "must have a valid modifier" do
    proc {
      Fluxx::Card.create(type: :rule,
                         name: 'Play 9',
                         description: 'Invalid: Play 9 cards',
                         # This is really 'play_limit'
                         modifier: :play_count,
                         new: 2)
    }.must_raise Fluxx::MissingAttributeError
  end
end
