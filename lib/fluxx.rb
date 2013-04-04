module Fluxx
  require 'fluxx/library'
  require 'fluxx/version'
  require 'fluxx/game'
  require 'fluxx/player'
  require 'fluxx/card/keeper'
  require 'fluxx/card/goal'
  require 'fluxx/card/rule'
  require 'fluxx/card/creeper'

  class Error < StandardError; end

  class MissingAttributeError < Error; end
  class CardAlreadyExistsError < Error; end
  class UnknownCardError < Error; end
  class UnobtainableGoalError < Error; end
  class MissingDeckError < Error; end
  class NotEnoughPlayersError < Error; end
  class GameAlreadyStartedError < Error; end
end
