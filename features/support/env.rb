# require 'ruby-debug'
require 'aruba/cucumber'

Before do
  @aruba_timeout_seconds = 3
end

CLEAN_GEMSET = 'delete_me'

Before('@gemset') do
  puts "INFO: feature may be slow, please be patient."
  run_simple("rvm --force gemset delete #{CLEAN_GEMSET}", true)
  @aruba_timeout_seconds = 20
end

