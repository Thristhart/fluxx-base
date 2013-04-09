require 'fluxx'
require 'fluxx/ruleset'

class Fluxx::Game
  attr_accessor :deck, :players, :discard
  attr_reader :ruleset, :turn, :current_player

  def initialize
    reset!
  end

  def reset!
    @started = false
    @deck = []
    @players = []
    @ruleset = Fluxx::Ruleset.new(self)
    discard = []
  end

  def start
    raise Fluxx::GameAlreadyStartedError if @started
    raise Fluxx::NotEnoughPlayersError if @players.length < 2
    raise Fluxx::MissingDeckError if @deck.length == 0
    raise Fluxx::TooSmallDeckError if deck.length < (players.length * 3) + 3

    @deck.shuffle!
    @started = true
    @current_player = players.first
    @turn = 0

    players.each do |player|
      3.times do
        player.give deck.shift
      end
    end
  end

  def started?
    @started
  end

  def next_turn
    @turn += 1
    @current_player = players[(players.index(@current_player) + 1) % players.length]
  end

end
