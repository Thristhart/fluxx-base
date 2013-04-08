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
end
