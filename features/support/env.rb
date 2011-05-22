# require 'ruby-debug'
require 'aruba/cucumber'

Before do
  @aruba_timeout_seconds = 3
end

Before('@gemset') do
  @aruba_timeout_seconds = 5
end

