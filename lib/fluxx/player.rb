class Fluxx
  class Player
    attr_reader :hand, :id
    def initialize(id)
      @hand = []
      @id = id
    end
  end
end
