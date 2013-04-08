require 'fluxx'
require 'fluxx/card'
require 'fluxx/ruleset'

class Fluxx::Card::Rule < Fluxx::Card
  def initialize(options)
    super

    # Must have a modifier & the new value
    raise Fluxx::MissingAttributeError unless options[:new] and options[:modifier]
    @modifier = options[:modifier]
    @new_value = options[:new]

    raise Fluxx::MissingAttributeError unless Fluxx::Ruleset.defaults.keys.include? options[:modifier]
  end

  def play(ruleset, player)
    ruleset.instance_variable_set "@" + @modifier.to_s, @new_value if @modifier and @new_value
  end

  def validate
    #
  end
end
