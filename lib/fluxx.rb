module Fluxx
  require 'fluxx/library'
  require 'fluxx/version'
  require 'fluxx/game'
  require 'fluxx/player'
  require 'fluxx/card'

  class Error < StandardError; end

  class MissingAttributeError < Error; end
  class CardAlreadyExistsError < Error; end
end
