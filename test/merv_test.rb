#= require ../src/merv

class MervTest < MTest::Unit::TestCase

  def setup
    @merv = Merv.new
  end

  def test_sanity
    assert @merv.is_a?(Merv)
  end
end

MTest::Unit.new.run
