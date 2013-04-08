require 'fluxx'

class Fluxx::Ruleset
  attr_accessor :play_limit, :draw_limit, :goal_limit, :keeper_limit, :hand_limit, :criteria, :goal
  attr_reader :game

  def initialize(game)
    @defaults = {
      play_limit: 1,
      draw_count: 1,
      goal_limit: 1,
      keeper_limit: 0,
      hand_limit: 0}
    
    @game = game

    @defaults.keys.each do |k|
      default(k)
    end

  end

  def default(variable)
    instance_variable_set('@' + variable.to_s, @defaults[variable])
  end
end
