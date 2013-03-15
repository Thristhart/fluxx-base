require 'helper'
require 'fluxx/library'
require 'fluxx/card'

describe Fluxx::Library do
  describe "can fetch a card given it's name" do
    # Card.create factory appends the card to the Library
    shackles = Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")
    # Retrieve a card from the library
    other_shackles = Fluxx::Library["Shackles"]
    # Should be the same card
    other_shackles.must_be_same_as shackles
  end

  describe "can't create the same card twice" do
    Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")
    proc {
      Fluxx::Card.create(type: :creeper, name: "Shackles", description: "Matches on the card name, ignored!")
    }.must_raise Fluxx::CardAlreadyExistsError
  end
end
