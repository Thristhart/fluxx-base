require 'fluxx'
require 'fluxx/card'
class Fluxx::Card::Creeper < Fluxx::Card
  def play(ruleset, player)
    player.creepers << self
  end

  def discard(ruleset, player)
    raise NotImplementedError
  end
end
