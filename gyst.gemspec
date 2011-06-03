# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gyst/version"

Gem::Specification.new do |s|
  s.name        = "gyst"
  s.version     = Gyst::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matt Scilipoti"]
  s.email       = ["matt@scilipoti.name"]
  s.homepage    = ""
  s.summary     = %q{A suite of helpers to aid in speeding up your tests.}
  s.description = %q{A suite of helpers to aid in speeding up your tests; including scripts, existing libraries, and patches.
  }

  s.rubyforge_project = "gyst"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('aruba')
  s.add_development_dependency('awesome_print')
  s.add_development_dependency('minitest')
  s.add_development_dependency('rake')
end
