require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/player'

describe Fluxx::Player do
  before do
    @player = Fluxx::Player.new
  end

  it "can be created with no arguments" do
    @player.must_be_instance_of Fluxx::Player
  end

  it "can be given a card" do

  end
  
end
