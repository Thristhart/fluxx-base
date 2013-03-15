require 'fluxx'
class Fluxx::Player
  attr_reader :hand, :id
  def initialize(id)
    @hand = []
    @id = id
  end
end
