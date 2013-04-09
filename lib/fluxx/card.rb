require 'fluxx'
class Fluxx::Card
  include Comparable
  def self.create(options)
    raise Fluxx::MissingAttributeError unless options[:type] && options[:name]

    type = options.delete :type
    card = const_get(type.to_s.capitalize).new(options)

    Fluxx::Library.append(card)

    return card
  end

  attr_reader :name, :description, :set

  def initialize(options)
    @name = options[:name]
    @description = options[:description]
    @set = options[:set] || "Fluxx"
  end

  def play(ruleset, player)
    raise NotImplementedError
  end

  def cleanup(ruleset, player)
    ruleset.default @play_mod if @play_mod && @play_value
  end

  def <=>(other)
    @name <=> other.name
  end
end

require 'fluxx/card/keeper'
require 'fluxx/card/goal'
require 'fluxx/card/rule'
require 'fluxx/card/creeper'
require 'fluxx/cards'
