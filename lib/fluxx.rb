module Fluxx
  require 'fluxx/version'
  require 'fluxx/game'
  require 'fluxx/deck'
  require 'fluxx/player'
  require 'fluxx/card'

  class Error < StandardError; end

  class MissingAttributeError < Error; end
end
