# File: /Users/ambethia/Projects/mruby/merv/src/merv.rb
class Merv
end

# File: /Users/ambethia/Projects/mruby/merv/test/merv_test.rb

class MervTest < MTest::Unit::TestCase

  def test_sanity
    assert Merv.new.is_a?(Merv)
  end
end

MTest::Unit.new.run

