require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/card/keeper'

describe Fluxx::Card::Keeper do
  before do
    # A keeper with nothing special
    @sloop = Fluxx::Card.create(type: :keeper, name: "Sloop", category: :ship, set: 'Pirate')

    # The captain's hat! Arr, 'matey!
    @captain_hat = Fluxx::Card.create(type: :keeper, name: "Captain's Hat", set: 'Pirate') do |rules, player|
      player.title << "Captain"
      rules.special[:captain] = player
    end
  end

  it "should be of the correct class" do
    @sloop.must_be_kind_of Fluxx::Card
    @sloop.must_be_instance_of Fluxx::Card::Keeper
  end

  it "should have no default category" do
    @captain_hat.category == nil
  end

  it "should have a defined category" do
    @sloop.category == :ship
  end

  it "should respond to special" do
    @sloop.respond_to? :special
  end
end

