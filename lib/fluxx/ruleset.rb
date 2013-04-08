require 'fluxx'

class Fluxx::Ruleset
  attr_accessor :play_limit, :draw_limit, :goal_limit, :keeper_limit, :hand_limit, :criteria, :goal
  attr_reader :game

  def initialize
    self.defaults.each do |rule, value|
      send(:"#{rule}=", value)
    end
  end

  def self.defaults
    {
      play_limit:   1,
      draw_count:   1,
      goal_limit:   1,
      keeper_limit: 0
    }
  end
end
