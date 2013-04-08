require 'fluxx'
class Fluxx::Player
  attr_reader :hand, :keepers, :creepers
  def initialize
    @hand, @keepers, @creepers = [], [], []
  end
  def play(card, ruleset)
    card.play ruleset, self
    @hand.delete card
  end
  def give(card)
    @hand << card
  end
  def draw(ruleset)
    ruleset.draw_limit.times do 
      card = ruleset.game.deck.pop
      give card
    end
  end
end
