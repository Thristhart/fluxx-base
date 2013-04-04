require 'fluxx'
class Fluxx::Library
  class << self
    @@cards = {}
    def append(card)
      raise Fluxx::CardAlreadyExistsError if @@cards.include? card.name
      @@cards[card.name] = card
    end

    def [](name)
      card = @@cards[name]
      raise Fluxx::UnknownCardError unless card
      return card
    end

    def clear!
      @@cards.clear
    end

    def set(set_name)
      result = []
      @@cards.each do |name, card|
        result << card if card.set == set_name
      end
      return result
    end

    def count
      return @@cards.count
    end

    def cards
      return @@cards
    end

    def cards=(new)
      return @@cards = new
    end
  end
end
