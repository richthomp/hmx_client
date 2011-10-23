# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hmx_client/version"

Gem::Specification.new do |s|
  s.name        = "hmx_client"
  s.version     = HmxClient::VERSION
  s.authors     = ["Alan Moore"]
  s.email       = ["ukmoore@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/hmx_client"
  s.summary     = %q{HMX Client is used to interact with the Jagwire HMX environment, usually hosted as an addon to Heroku}
  s.description = %q{Gives a client the ability to interact fully with the API for HMX}

  s.rubyforge_project = "hmx_client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "json"
end
