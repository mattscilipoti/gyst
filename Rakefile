require 'bundler'
Bundler::GemHelper.install_tasks


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

