require 'fluxx'
class Fluxx::Game
  attr_accessor :deck, :players
  attr_reader :ruleset
  def initialize
    reset!
  end

  def reset!
    @started = false
    @deck = []
    @players = []
    @ruleset = Fluxx::Ruleset.new(self)
  end

  def start
    raise Fluxx::GameAlreadyStartedError if @started
    raise Fluxx::NotEnoughPlayersError if @players.length < 2
    raise Fluxx::MissingDeckError if @deck.length == 0

    @started = true
  end
end
