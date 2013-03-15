module Fluxx
  class Card
    def self.create(options, play_behavior, cleanup_behavior)
      type = options.delete :type
      const_get(type.to_s.capitalize).new(options, play_behavior, cleanup_behavior)
    end

    def initialize(options, play_behavior, cleanup_behavior)
      @play_behavior = play_behavior
      @cleanup_behavior = cleanup_behavior

      @name = options[:name]
      @description = options[:description]
      @set = options[:set]
    end
  end
end
