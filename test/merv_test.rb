#= require ../src/merv

class MervTest < MTest::Unit::TestCase

  def test_sanity
    assert Merv.new.is_a?(Merv)
  end
end

MTest::Unit.new.run
