require 'fluxx'
require 'fluxx/card'

class Fluxx::Card::Keeper < Fluxx::Card
  attr_accessor :category

  def initialize(options)
    super
    @category = options[:category]
  end

  def play(ruleset, player)
    raise Fluxx::TooManyKeepersError if player.keepers.length >= ruleset.keeper_limit
    player.keepers << self
  end
end
