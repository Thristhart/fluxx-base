require 'fluxx'
require 'fluxx/card'
#require 'fluxx/card/keeper'
class Fluxx::Card::Goal < Fluxx::Card
  attr_reader :goal, :categories
  def initialize(options)
    super

    raise Fluxx::MissingAttributeError unless options[:goal]

    @known_types = [:cards, :needs, :either]
    # make sure at least one of the known types is in here
    raise Fluxx::MissingAttributeError unless (options[:goal].keys & @known_types).any?


    @goal = options[:goal]
    @categories = @goal.keys - @known_types

    validate

  end

  def validate
    @known_types.each do |type|
      next unless @goal[type]
      raise Fluxx::MissingAttributeError unless @goal[type].any?
      @goal[type].each_with_index do |requirement, index|
        next if type == :needs && requirement.is_a?(Integer) && index == 0
        validate_card requirement
      end
    end
  end
  def validate_card(requirement)
    begin
      card = Fluxx::Library[requirement]
    rescue Fluxx::UnknownCardError
      raise Fluxx::UnobtainableGoalError
    end

    raise Fluxx::UnobtainableGoalError unless card.is_a? Fluxx::Card::Keeper
  end

  def play(ruleset, player)
    ruleset.criteria = @goal
    ruleset.goal = self
  end

  def discard(ruleset, player)
    ruleset.criteria = nil
    ruleset.goal = nil
  end

end
