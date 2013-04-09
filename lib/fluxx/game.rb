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
    @discard = []
  end

  def start
    raise Fluxx::GameAlreadyStartedError if @started
    raise Fluxx::NotEnoughPlayersError if @players.length < 2
    raise Fluxx::MissingDeckError if @deck.length == 0
    #raise Fluxx::TooSmallDeckError if deck.length < (players.length * 3) + 3

    @deck.shuffle!
    @started = true
    @current_player = players.first
    @turn = 0

    players.each do |player|
      draw_cards 3, player
    end
  end

  def started?
    @started
  end

  def next_turn
    raise Fluxx::TooLargeHandError if ruleset.hand_limit != 0 && @current_player.hand.length > ruleset.hand_limit

    @turn += 1
    @current_player = players[(players.index(@current_player) + 1) % players.length]
    draw_cards ruleset.draw_count, @current_player
  end

  private

  def draw_card(player)
    if @deck.length == 0
      @deck = @discard.shuffle
      @discard = []
    end

    player.give @deck.shift
  end

  def draw_cards(count, player)
    count.times do
      draw_card(player)
    end
  end

end
