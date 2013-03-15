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
    @ruleset = Fluxx::Ruleset.net
  end

  it "should define a new rule" do
    @player.play @play_2, @ruleset

    @ruleset.criteria.must_equal @treasure_chest.goal
  end

  it "requires a block for behaviour" do
    proc {
      Fluxx::Card.create(type: :rule,
                         name: "Play 6")
    }.must_raise Fluxx::MissingAttributeError
  end
end
