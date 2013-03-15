require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/game'

describe Fluxx::Game do
  before do
    @game = Fluxx::Game.new
  end

  describe "starts empty" do
    @game.players.must_be_empty
    @game.deck.must_be_empty
  end
end
