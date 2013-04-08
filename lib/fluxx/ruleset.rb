require 'fluxx'

class Fluxx::Ruleset
  attr_accessor :play_limit, :draw_count, :goal_limit, :keeper_limit, :hand_limit, :criteria, :goal
  attr_reader :game

  def initialize(game)
    @game = game

    self.class.defaults.each do |rule, value|
      send(:"#{rule}=", value)
    end
  end

  def self.defaults
    {
      play_limit:   1,
      draw_count:   1,
      goal_limit:   1,
      keeper_limit: 0,
      hand_limit:   0
    }
  end
end
