require 'helper'
require 'fluxx/ruleset'
require 'fluxx/player'
require 'fluxx/card'

describe Fluxx::RuleSet do
  describe "basic rule set" do
    before do
      @rules = Fluxx::RuleSet.new
    end

    it "must have only basic rules" do
      @rules.draw_count.must_equal 1
      @rules.play_limit.must_equal 1
    end

    it "must have no modifications" do
      @rules.modified?.must_be :==, :true
    end

    it "no other rules have been modified" do
      @rules.keeper_limit.must_equal 0
      @rules.hand_limit.must_equal 0
    end
  end

  describe "modified play limit rules" do
    before do
      @rules = Fluxx::RuleSet.new
      @player = Fluxx::Player.new

      # A few simple cards
      @play_4 = Fluxx::Card.create(type: :rule, name: 'Play 4', description: 'Play 4 cards') do |rules, player|
        rules.play_limit = 4
      end
      @play_2 = Fluxx::Card.create(type: :rule, name: 'Play 2', description: 'Play 2 cards') do |rules, player|
        rules.play_limit = 2
      end
      @play_all = Fluxx::Card.create(type: :rule, name: 'Play All', description: 'Play all cards in your hand') do |rules, player|
        rules.play_limit = 0
      end
    end

    it "changes the play limit when a rule is played" do
      @player.give play_4
      @player.play play_4, @rules

      @rules.play_limit.must_equal 4
    end

    it "replaces the rule" do
      @player.give play_2
      @player.give play_4

      @player.play play_4, @rules
      @player.play play_2, @rules

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
      @rules = Fluxx::RuleSet.new
      @player = Fluxx::Player.new

      # A couple of simple cards
      @draw_4 = Fluxx::Card.create(type: :rule, name: 'Draw 4', description: 'Draw 4 cards') do |rules, player|
        rules.draw_count = 4
      end
      @draw_2 = Fluxx::Card.create(type: :rule, name: 'Draw 2', description: 'Draw 2 cards') do |rules, player|
        rules.draw_count = 2
      end
      # This card will throw an error if it is every played
      @draw_0 = Fluxx::Card.create(type: :rule, name: 'Draw 0', description: 'This card causes errors') do |rules, player|
        rules.draw_count = 0
      end
    end

    it "changes the draw limit when a rule is drawed" do
      @player.give draw_4
      @player.draw draw_4, @rules

      @rules.draw_count.must_equal 4
    end

    it "replaces the rule" do
      @player.give draw_2
      @player.give draw_4

      @player.play draw_4, @rules
      @player.play draw_2, @rules

      @rules.draw_count.must_equal 2
    end

    it "can't draw less than 1 card" do
      @player.give draw_0

      proc { @player.play draw_0, @rules }.must_raise Fluxx::InvalidRuleError
    end
  end

  describe "changing the Goal" do
    before do
      @rules = Fluxx::RuleSet.new
      @player = Fluxx::Player.new
      @treasure_chest = Fluxx::Card.create(type: :goal,
                                           name: "Treasure Chest",
                                           set:  'Pirate',
                                           goal: { cards:["Strongbox"], booty:2 })
      @key_lime_pie = Fluxx::Card.create(type: :goal,
                                         name: "Key Lime Pie",
                                         set:  'Pirate',
                                         goal: { cards: ["Key", "Limes"] })
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
