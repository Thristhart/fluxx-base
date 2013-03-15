require 'simplecov'
SimpleCov.start

require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/library'

before do
  Fluxx::Library.clear!
end
