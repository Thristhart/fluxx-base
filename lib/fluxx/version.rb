require 'fluxx'
require 'gem/version'
module Fluxx
  VERSION = '0.0.1'

  def self.version
    Gem::Version.new(VERSION)
  end
end
