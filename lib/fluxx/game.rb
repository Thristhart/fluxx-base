class Fluxx:: Game
  def initialize
    @deck = []
    @players = []
    @ruleset = Ruleset.new()
  end

end
