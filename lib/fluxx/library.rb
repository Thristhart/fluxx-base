require 'fluxx'
class Fluxx::Library
  @@cards = {}
  def self.Append(card)
    raise CardAlreadyExistsError if @@cards.include? card.name
  end

  def self.[](name)
    return @@cards[name]
  end

end
