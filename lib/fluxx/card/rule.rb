require 'fluxx'
require 'fluxx/card'

class Fluxx::Card::Rule < Fluxx::Card
  def initialize(options)
    super

    # Must have a modifier & the new value
    raise Fluxx::MissingAttributeError unless options[:new] and options[:modifier]
  end

  def play(ruleset, player)
    nil
  end

  def validate
    #
  end
end
