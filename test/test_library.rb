require 'helper'
require 'fluxx/library'
require 'fluxx/card'

describe Fluxx::Library do
  before do
    # Save the internal library hash before clearing it
    @saved_library = Fluxx::Library.instance.dup
    Fluxx::Library.clear!
  end

  after do
    # And set it again later
    Fluxx::Library.instance = @saved_library
  end

  it "can fetch a card given it's name" do
    # Card.create factory appends the card to the Library
    shackles = Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")
    # Retrieve a card from the library
    other_shackles = Fluxx::Library["Shackles"]
    # Should be the same card
    other_shackles.must_be_same_as shackles
  end

  it "can't create the same card twice" do
    Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")
    proc {
      Fluxx::Card.create(type: :creeper, name: "Shackles", description: "Matches on the card name, ignored!")
    }.must_raise Fluxx::CardAlreadyExistsError
  end

  it "can be cleared" do
    Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")
    Fluxx::Library.clear!
    # No exceptions thrown
    Fluxx::Card.create(type: :creeper, name: "Shackles", description: "You can't win if you have this unless the Goal says otherwise.")
  end
end
