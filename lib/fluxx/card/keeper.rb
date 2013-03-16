require 'fluxx'
require 'fluxx/card'
class Fluxx::Card::Keeper < Fluxx::Card
  attr_accessor :category
  def initialize(options, play_behavior, cleanup_behavior)
    super
    @category = options[:category]
  end
  def play(ruleset, player)
    super
    player.keepers << self
  end
end
