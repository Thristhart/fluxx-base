require 'fluxx'
class Fluxx::Library
  class << self
    @@cards = {}
    def append(card)
      raise Fluxx::CardAlreadyExistsError if @@cards.include? card.name
      @@cards[card.name] = card
    end

    def [](name)
      return @@cards[name]
    end

    def clear!
      @@cards.clear
    end
  end
end
