require 'fluxx'
require 'fluxx/card'
class Fluxx::Card::Keeper < Fluxx::Card
  def play(ruleset, player)
    super
    player.keepers << self
  end
end
