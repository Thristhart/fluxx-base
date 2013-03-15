require 'helper'
require 'fluxx/game'

describe Fluxx::Game do
  before do
    @game = Fluxx::Game.new
  end

  after do
    @game.reset!
  end

  it "starts empty" do
    @game.players.must_be_empty
    @game.deck.must_be_empty
  end

  it "must have at least 2 players before starting or error" do
    proc { @game.start }.must_raise Fluxx::NotEnoughPlayersError
  end

  it "must have a deck before starting or error" do
    @game.players << Fluxx::Player.new
    @game.players << Fluxx::Player.new
    proc { @game.start }.must_raise Fluxx::MissingDeckError
  end

  it "must have at least 2 players and a deck" do
    @game.players << Fluxx::Player.new
    @game.players << Fluxx::Player.new
    @game.deck = Fluxx::Library.set(:pirate)

    @game.start
  end
end
