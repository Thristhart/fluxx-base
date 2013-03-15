module Fluxx
  require 'fluxx/library'
  require 'fluxx/version'
  require 'fluxx/game'
  require 'fluxx/player'
  require 'fluxx/card/keeper'
  require 'fluxx/card/goal'
  require 'fluxx/card/rule'

  class Error < StandardError; end

  class MissingAttributeError < Error; end
  class CardAlreadyExistsError < Error; end
end
