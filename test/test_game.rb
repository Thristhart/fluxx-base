require 'minitest/spec'
require 'minitest/autorun'

describe Game do
  before do
    @game = Game.new(4)
  end

  describe "when just initialized" do
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
  end
end
