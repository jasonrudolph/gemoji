require 'minitest/autorun'

class TestCase < MiniTest::Test
  def self.test(name, &block)
    define_method(:"test_#{name.inspect}", &block)
  end
end
