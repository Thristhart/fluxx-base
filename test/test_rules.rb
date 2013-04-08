require 'helper'
require 'fluxx/ruleset'
require 'fluxx/player'
require 'fluxx/card'

describe Fluxx::Ruleset do
  describe "basic rule set" do
    before do
      @game = Fluxx::Game.new
      @rules = @game.ruleset
    end

    it "must have only basic rules" do
      @rules.draw_limit.must_equal 1
      @rules.play_limit.must_equal 1
      @rules.keeper_limit.must_equal 0
      @rules.hand_limit.must_equal 0
    end
  end

  describe "modified play limit rules" do
    before do
      @game = Fluxx::Game.new
      @rules = @game.ruleset
      @player = Fluxx::Player.new

      @play_4 = Fluxx::Library['Play 4']
      @play_2 = Fluxx::Library['Play 2']
      @play_all = Fluxx::Library['Play All']
    end

    it "changes the play limit when a rule is played" do
      @player.give @play_4
      @player.play @play_4, @rules

      @rules.play_limit.must_equal 4
    end

    it "replaces the rule" do
      @player.give @play_2
      @player.give @play_4

      @player.play @play_4, @rules
      @player.play @play_2, @rules

      @rules.play_limit.must_equal 2
    end

    it "can be 0 to mean play all" do
      @player.give @play_all
      @player.play @play_all, @rules
      @rules.play_limit.must_equal 0
    end
  end

  describe "modified card drawing rules" do
    before do
      @game = Fluxx::Game.new
      @rules = @game.ruleset
      @player = Fluxx::Player.new

      @draw_4 = Fluxx::Library['Draw 4']
      @draw_2 = Fluxx::Library['Draw 2']
    end

    it "changes the number of cards drawn based on draw_limit" do
      @player.give @draw_4
      @player.play @draw_4, @rules
      
      @player.draw @rules

      @rules.draw_limit.must_equal 4
      @player.hand.length.must_equal 4
    end

    it "replaces the rule" do
      @player.give @draw_2
      @player.give @draw_4

      @player.play @draw_4, @rules
      @player.play @draw_2, @rules

      @rules.draw_limit.must_equal 2
    end
  end

  describe "changing the Goal" do
    before do
      @game = Fluxx::Game.new
      @rules = @game.ruleset
      @player = Fluxx::Player.new
      @treasure_chest = Fluxx::Library["Treasure Chest"]
      @key_lime_pie = Fluxx::Library["Key Lime Pie"]
      @player.give @treasure_chest
      @player.give @key_lime_pie
    end

    it 'sets the goal' do
      @player.play @treasure_chest, @rules
      @rules.goal.must_be_same_as @treasure_chest
    end

    it 'overrides the goal' do
      @player.play @treasure_chest, @rules
      @player.play @key_lime_pie, @rules
      @rules.goal.must_be_same_as @key_lime_pie
    end

    it 'may have 2 goals only if Double Agenda is played' do
      skip "Need to implement Double Agenda first"
    end
  end
end
