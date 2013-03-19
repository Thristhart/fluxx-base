require 'fluxx'
class Fluxx::Player
  attr_reader :hand, :keepers, :creepers
  def initialize
    @hand, @keepers, @creepers = [], [], []
  end
  def play(card, ruleset)
    card.play self, ruleset
    @hand.delete card
  end
end
