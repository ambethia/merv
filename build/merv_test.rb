# File: /Users/ambethia/Projects/mruby/merv/src/main.rb
puts "Hello, world!"

# File: /Users/ambethia/Projects/mruby/merv/test/merv_test.rb

class Test4MTest < MTest::Unit::TestCase
  def test_assert
    assert(true)
    assert(true, 'true sample test')
  end
end

MTest::Unit.new.run

