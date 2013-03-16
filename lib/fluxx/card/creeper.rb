require 'fluxx'
require 'fluxx/card'
class Fluxx::Card::Creeper < Fluxx::Card
  def play(ruleset, player)
    super
    player.creepers << self
  end

end
