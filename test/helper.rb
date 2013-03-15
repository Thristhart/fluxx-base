require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/library'
require 'fluxx/game'

before do
  Fluxx::Library.clear!
  Fluxx::Game.reset!
end
