# since use of this "patch" is optional,
#   we should not add "factory_girl" as a dependency
begin
  require 'factory_girl'
rescue LoadError
  $stderr.puts <<-EOS
#{'*'*50}
  "ERROR: Could not find 'factory_girl'.
     You should either install it (https://github.com/thoughtbot/factory_girl)
     or be more specific about which parts of `gyst` you would like to use (see README)."
#{'*'*50}
  EOS

  raise
end

Factory.class_eval do
  # change default_strategy to build, instead of :create
  # TODO: patch FactoryGirl to allow setting overall default_strategy
  def default_strategy #:nodoc:
    @options[:default_strategy] || :build
  end
end

