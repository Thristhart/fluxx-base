require 'helper'
require 'fluxx/game'
require 'fluxx/player'
require 'fluxx/library'

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

    @game.players << Fluxx::Player.new
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

  it "can't start a game twice" do
    @game.players << Fluxx::Player.new
    @game.players << Fluxx::Player.new
    @game.deck = Fluxx::Library.set(:pirate)

    @game.start

    proc { @game.start }.must_raise Fluxx::GameAlreadyStartedError
  end

  it "can start" do
    @game.players << Fluxx::Player.new
    @game.players << Fluxx::Player.new
    @game.deck = Fluxx::Library.set(:pirate)

    old_deck = @game.deck.dup

    @game.start
    @game.players.wont_be_empty
    @game.deck.wont_be_empty
    # Make sure the deck has been shuffled
    @game.deck.wont_equal old_deck
  end

  it "can be reset" do
    @game.players << Fluxx::Player.new
    @game.players << Fluxx::Player.new
    @game.deck = Fluxx::Library.set(:pirate)

    @game.start
    @game.reset!

    @game.players.must_be_empty
    @game.deck.must_be_empty
  end

  describe "playing a game" do
    before do
      # Build a quick game between 2 players
      @game = Fluxx::Game.new
      @game.players << Fluxx::Player.new
      @game.players << Fluxx::Player.new
      @game.deck = Fluxx::Library.set(:pirate)
      @game.start
    end

    after do
      @game.reset!
    end

    it "tracks the current turn" do
      @game.turn.must_equal 0
      @game.current_player.must_equal @game.players.first

      @game.next_turn

      @game.turn.must_equal 1
      @game.current_player.must_equal @game.players[1]
    end
  end
end
