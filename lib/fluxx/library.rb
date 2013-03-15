require 'fluxx'
class Fluxx::Library
  def << self
    @@cards = {}
    def append(card)
      raise CardAlreadyExistsError if @@cards.include? card.name
    end

    def [](name)
      return @@cards[name]
    end

    def clear!
      @@cards.clear
    end
  end
end
