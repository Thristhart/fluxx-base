require 'fluxx'
require 'fluxx/card'
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
      if(@goal[type])
       raise Fluxx::MissingAttributeError unless @goal[type].any? 
       @goal[type].each do |requirement|
         raise Fluxx::UnobtainableGoalError Fluxx::Library[requirement]
       end
      end
    end
  end

end
