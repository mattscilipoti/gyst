require 'minitest/autorun'
# require 'minitest/pride' # undefined method `output' for MiniTest::Unit:Class (NoMethodError)

require File.expand_path('../lib/gyst/factory_girl', File.dirname(__FILE__))


describe Factory do
  it "should use :build by default" do
    subject = Factory.new(:test)
    subject.default_strategy.must_equal :build
  end
end
