require 'fluxx'
require 'set'

class Fluxx::Player
  attr_reader :keepers, :creepers

  def initialize
    @hand, @keepers, @creepers = Set.new, [], []
  end

  def play(card, ruleset)
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
    ruleset.draw_limit.times do 
      card = ruleset.game.deck.pop
      give card
    end
  end
end
