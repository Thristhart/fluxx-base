require 'fluxx'
require 'set'

class Fluxx::Player
  attr_reader :keepers, :creepers
  attr_accessor :plays_this_turn

  def initialize
    @hand, @keepers, @creepers = Set.new, [], []
    @plays_this_turn = 0
  end

  def play(card, ruleset)
    raise Fluxx::OutOfTurnError if ruleset.game.current_player != self
    raise Fluxx::TooManyPlaysError if @plays_this_turn >= ruleset.play_limit && ruleset.play_limit != 0
    raise Fluxx::NotInHandError unless @hand.include? card

    @plays_this_turn += 1
    card.play ruleset, self
    @hand.delete card
  end

  def give(card)
    raise Fluxx::CardAlreadyExistsError if @hand.include? card

    @hand.add? card
  end

  def hand
    @hand.to_a
  end

  def draw(ruleset)
    ruleset.draw_count.times do 
      card = ruleset.game.deck.pop
      give card
    end
  end

  def discard(card, ruleset)
    raise Fluxx::NotInHandError unless ( @hand.include? card or keepers.include? card or creepers.include? card )
    card.discard ruleset, self
    @hand.delete card
  end
end
