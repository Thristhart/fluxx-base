require 'fluxx'
require 'fluxx/card'
class Fluxx::Card::Goal < Fluxx::Card
  attr_reader :goal, :categories
  def initialize(options)
    raise Fluxx::MissingAttributeError unless options[:goal]

    known_types = [:cards, :needs, :either]
    # make sure at least one of the known types is in here
    raise Fluxx::MissingAttributeError unless (options[:goal].keys & known_types).any?


    @goal = options[:goal]
    @categories = @goal - known_types
  end

end
