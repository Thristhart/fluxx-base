require 'fluxx'
class Fluxx::Card
  def self.create(options, play_behavior=nil, cleanup_behavior=nil)
    raise Fluxx::MissingAttributeError unless options[:type] && options[:name]
    
    type = options.delete :type
    card = const_get(type.to_s.capitalize).new(options, play_behavior, cleanup_behavior)

    Fluxx::Library.append(card)

    return card
  end

  attr_reader :name, :description, :set

  def initialize(options, play_behavior, cleanup_behavior)
    @play_behavior = play_behavior
    @cleanup_behavior = cleanup_behavior

    @name = options[:name]
    @description = options[:description]
    @set = options[:set] || "Fluxx"
  end

  def play(ruleset, player)
    @play_behavior.call(ruleset, player) if @play_behavior # the only thing that all card types do
  end
  def cleanup(ruleset, player)
    @cleanup_behavior.call(ruleset, player) if @cleanup_behavior
  end
end
