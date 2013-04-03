require 'fluxx'
class Fluxx::Ruleset
  attr_accessor :play_limit, :draw_limit, :goal_limit, :keeper_limit, :criteria
  def initialize
    @defaults = {
      play_limit: 1,
      draw_limit: 1,
      goal_limit: 1,
      keeper_limit: 1}

    @defaults.keys.each do |k|
      default(k)
    end
  end

  def default(variable)
    instance_variable_set('@' + variable.to_s, @defaults[variable])
  end
end
