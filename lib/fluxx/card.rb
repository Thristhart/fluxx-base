require 'fluxx'
class Fluxx::Card
  def self.create(options, play_behavior=nil, cleanup_behavior=nil)
    raise MissingAttributeError unless options[:type] && options[:name]
    
    type = options.delete :type
    card = const_get(type.to_s.capitalize).new(options, play_behavior, cleanup_behavior)

    Fluxx::Library.Append(card)

    return card
  end

  def initialize(options, play_behavior, cleanup_behavior)
    @play_behavior = play_behavior
    @cleanup_behavior = cleanup_behavior

    @name = options[:name]
    @description = options[:description]
    @set = options[:set]
  end

  def play(ruleset, player)
    @play_behavior.call(ruleset, player) # the only thing that all card types do
  end
  def cleanup(ruleset, player)
    @cleanup_behavior.call(ruleset, player)
  end
end
