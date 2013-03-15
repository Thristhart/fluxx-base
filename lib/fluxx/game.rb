module Fluxx
  class Game
    def initialize
      @deck = []
      @players = []
      @ruleset = Ruleset.new()
    end

  end
end
