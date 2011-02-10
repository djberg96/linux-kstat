require 'rubygems'
gem 'test-unit'

require 'test/unit'
require 'linux/kstat'

class TC_Linux_Kstat < Test::Unit::TestCase
  def setup
    @kstat = Linux::Kstat.new
  end

  test "kstat object can be accessed like a hash" do
    assert_respond_to(@kstat, :[])
    assert_nothing_raised{ @kstat[:cpu] }
  end

  test "kstat object contains expected keys" do
    assert_kind_of(Hash, @kstat[:cpu])
    assert_kind_of(Numeric, @kstat[:btime])
    assert_kind_of(Array, @kstat[:intr])
  end

  test "values cannot be assigned to keys" do
    assert_raise(NoMethodError){ @kstat[:cpu] = 'test' }
  end

  def teardown
    @kstat = nil
  end
end
