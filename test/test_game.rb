require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/game'

describe Fluxx::Game do
  describe "with 4 players" do
    before do
      @game = Fluxx::Game.new(4)
    end

    it "must have 4 players" do
      @game.players.size.must_equal 4
    end
    
    it "each player has 3 cards" do
      @game.players.each do |player|
        player.hand.size.must_equal 3
      end
    end
    
    it "deck size be 12 fewer" do
      @games.deck.size.must_equal (100-12)
    end
    
    it "have a ruleset" do
      @games.must_respond_to :rules
    end
    
    it "must be able to play a turn" do
      @games.must_respond_to :turn
    end
  end
end
