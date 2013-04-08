require 'fluxx'
require 'fluxx/card'
class Fluxx::Card::Creeper < Fluxx::Card
  def play(ruleset, player)
    player.creepers << self
  end
end
