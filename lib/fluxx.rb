module Fluxx
  require 'fluxx/library'
  require 'fluxx/version'
  require 'fluxx/game'
  require 'fluxx/player'

  class Error < StandardError; end

  class MissingAttributeError < Error; end
  class CardAlreadyExistsError < Error; end
  class UnknownCardError < Error; end
  class UnobtainableGoalError < Error; end
  class MissingDeckError < Error; end
  class NotEnoughPlayersError < Error; end
  class GameAlreadyStartedError < Error; end
  class InvalidRuleError < Error; end
end
