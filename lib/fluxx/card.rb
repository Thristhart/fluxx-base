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
    @play_mod = options[:mod]
    @play_value = options[:new]

    @name = options[:name]
    @description = options[:description]
    @set = options[:set] || "Fluxx"
  end

  def play(ruleset, player)
    ruleset.send "#{@play_mod}=", @play_value if @play_mod and @play_value # the only thing that all card types do
  end
  def cleanup(ruleset, player)
    ruleset.default @play_mod if @play_mod && @play_value
  end

  def <=>(other)
    @name <=> other.name
  end
end
