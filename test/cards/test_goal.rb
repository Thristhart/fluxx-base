require 'helper'
require 'fluxx/card/goal'
require 'fluxx/player'
require 'fluxx/ruleset'
require 'fluxx/library'

describe Fluxx::Card::Goal do
  before do
    @treasure_chest = Fluxx::Library["Treasure Chest"]

    @player = Fluxx::Player.new
    @game = Fluxx::Game.new
    @ruleset = @game.ruleset
  end

  it "should be of the correct class" do
    @treasure_chest.must_be_kind_of Fluxx::Card
    @treasure_chest.must_be_instance_of Fluxx::Card::Goal
  end

  it "should define the new goal" do
    @treasure_chest.play(@ruleset, @player)

    @ruleset.criteria.must_equal @treasure_chest.goal
  end

  it "requires a goal to be defined" do
    proc { 
      Fluxx::Card.create(type: :goal,
                         name: "Gems")
    }.must_raise Fluxx::MissingAttributeError
  end

  it "should check if a goal can be obtained" do
    proc {
      Fluxx::Card.create(type: :goal,
                         name: "Failure Test",
                         goal: { cards: ["Doesn't exist 1", "Doesn't exist 2"] })
    }.must_raise Fluxx::UnobtainableGoalError

    proc {
      Fluxx::Card.create(type: :goal,
                         name: "Failure Test",
                         goal: { needs: [1, "Doesn't exist 1", "Doesn't exist 2"] })
    }.must_raise Fluxx::UnobtainableGoalError

    proc {
      Fluxx::Card.create(type: :goal,
                         name: "Failure Test",
                         goal: { either: ["Doesn't exist 1", "Doesn't exist 2"] })
    }.must_raise Fluxx::UnobtainableGoalError
  end
end
