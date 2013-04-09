require 'fluxx'
require 'fluxx/ruleset'

class Fluxx::Game
  attr_accessor :deck, :players, :discard
  attr_reader :ruleset, :turn, :current_player, :winner

  def initialize
    reset!
  end

  def reset!
    @started = false
    @deck = []
    @players = []
    @ruleset = Fluxx::Ruleset.new(self)
    @discard = []
    # Will be set to the Player who won
    @winner = nil
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
    if @current_player.hand.length > 0 && ruleset.play_limit == 0
      raise Fluxx::NotEnoughPlaysError
    else
      raise Fluxx::NotEnoughPlaysError if @current_player.plays_this_turn < ruleset.play_limit
    end
    raise Fluxx::TooManyKeepersError if ruleset.keeper_limit != 0 && player.keepers.length >= ruleset.keeper_limit
    check_winner

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

  def check_winner
    players.each do |player|
      goal_cards = (ruleset.goal.goal[:cards] || []).map { |card_name| Fluxx::Library[card_name] }

      goal_needs = ruleset.goal.goal[:needs] || []
      goal_needs_count = goal_needs.shift || 999999999999 # XXX: This should be enough for anybody...
      goal_needs_cards = goal_needs.map { |card_name| Fluxx::Library[card_name] }
      
      goal_either = (ruleset.goal.goal[:either] || []).map { |card_name| Fluxx::Library[card_name] }

      # Checking the normal cards rule
      trial_one = (player.keepers & goal_cards).length == goal_cards.length

      # Checking the needs X of [Set] rule
      trial_two = (player.keepers & goal_needs_cards).length >= goal_needs_count

      # Checking the either goal rule
      trial_three = goal_either.each do |card|
        break true if player.keepers.include? card
      end

      categories = ruleset.goal.goal.dup
      catgeories.delete(:either)
      catgeories.delete(:cards)
      catgeories.delete(:needs)

      trial_four = nil

      categories.keys.each do |category|
        count = categories[:category]
        all_in_category = Fluxx::Library.cards.select do |card_name, card|
          next unless card.is_a? Fluxx::Card::Keeper

          card.category == category
        end

        trial_four ||= (player.keepers & all_in_category).length >= count
      end

      raise Fluxx::YouWinError if !! (
        (trial_one unless goal_cards.empty?) &&
        (trial_two unless goal_needs_cards.empty?) &&
        (trial_three unless goal_either.empty) &&
        (trial_four unless trial_four.nil?)
      )
    end
  end

end
