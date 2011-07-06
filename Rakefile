require 'bundler'
Bundler::GemHelper.install_tasks
require 'ap'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/*_spec.rb"
end


require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty --tags ~@gemset"
end

task :default => [:test, :features]


# rake tasks for testing
task :pass do
  puts "PASSED"
end

task :fail do
  fail "EXPECTED FAILURE"
end

namespace :gyst do
  desc 'Display info related to gyst (env vars, etc)'
  task :info do
    env_vars = %w{
      RAILS_ENV
      RUBY_GC_MALLOC_LIMIT
      RUBY_HEAP_FREE_MIN
      RUBY_HEAP_MIN_SLOTS
      RUBY_HEAP_SLOTS_INCREMENT
      RUBY_HEAP_SLOTS_GROWTH_FACTOR
    }
    env_var_values = env_vars.inject({}) do |result, var_name|
      result[var_name] = ENV[var_name]
      result
    end

    ap env_var_values
  end
end
