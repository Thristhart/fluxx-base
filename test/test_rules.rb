require 'minitest/spec'
require 'minitest/autorun'

require 'fluxx/ruleset'

describe Fluxx::RuleSet do
  before do
    @rules = Fluxx::RuleSet.new
  end

  it "must have only basic rules" do
    @rules.draw_count.must_equal 1
    @rules.play_limit.must_equal 1
  end

  it "must have no modifications" do
    @rules.modified?.must_be :==, :true
  end
end
