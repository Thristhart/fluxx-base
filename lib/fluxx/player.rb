require 'fluxx'
class Fluxx::Player
  attr_reader :hand
  def initialize
    @hand = []
  end
end
