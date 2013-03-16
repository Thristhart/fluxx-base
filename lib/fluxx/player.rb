require 'fluxx'
class Fluxx::Player
  attr_reader :hand, :keepers, :creepers
  def initialize
    @hand, @keepers, @creepers = [], [], []
  end
end
