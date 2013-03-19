require 'fluxx'
class Fluxx::Ruleset
  attr_accessor :play_limit, :draw_limit, :goal_limit, :keeper_limit
  def initialize
    @defaults = {
      play_limit: 1,
      draw_limit: 1,
      goal_limit: 1,
      keeper_limit: 1}
    @play_limit = @draw_limit = 1
  end

  def default(variable)
    
  end

end
