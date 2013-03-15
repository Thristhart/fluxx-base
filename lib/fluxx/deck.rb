module Fluxx
  class Deck
    def initialize(cardset)
      @cards = cardset
    end

    def shuffle
      @cards.shuffle!
    end

    def draw(count = 1)
      @cards.pop(count)
    end

    def put_on_top(cards)
      @cards += cards
    end

    def put_on_bottom(cards)
      @cards = cards + @cards
    end

    def shuffle_in(cards)
      put_on_top cards
      shuffle
    end
  end
end
