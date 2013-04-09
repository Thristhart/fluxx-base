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
  class TooSmallDeckError < Error; end
  class TooManyKeepersError < Error; end
  class TooLargeHandError < Error; end
  class NotEnoughPlaysError < Error; end
  class TooManyPlaysError < Error; end
  class OutOfTurnError < Error; end
  class NotInHandError < Error; end
end
