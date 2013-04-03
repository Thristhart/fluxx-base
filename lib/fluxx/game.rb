require 'fluxx'
class Fluxx::Game
  attr_accessor :deck, :players
  attr_reader :ruleset
  def initialize
    reset!
  end

  def reset!
    @deck = []
    @players = []
    @ruleset = Fluxx::Ruleset.new()
  end
end
