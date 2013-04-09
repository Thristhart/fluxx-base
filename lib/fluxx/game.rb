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
    # The game starts immediately, with the first player drawing their card
    draw_cards ruleset.draw_count, @current_player
  end

  def started?
    @started
  end

  def next_turn
    raise Fluxx::TooLargeHandError if ruleset.hand_limit != 0 && @current_player.hand.length > ruleset.hand_limit
    raise Fluxx::NotEnoughPlaysError if @current_player.hand.length > 0 && @current_player.plays_this_turn < ruleset.play_limit
    raise Fluxx::TooManyKeepersError if ruleset.keeper_limit != 0 && player.keepers.length >= ruleset.keeper_limit

    # Increment the turn, move on..
    @turn += 1
    # Reset the player's action count to 0 in preparation for the next turn
    @current_player.plays_this_turn = 0

    # Switch to the next player
    @current_player = players[(players.index(@current_player) + 1) % players.length]

    # And give them the new cards
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
