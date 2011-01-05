# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cps-client/version"

Gem::Specification.new do |s|
  s.name        = "cps-client"
  s.version     = CPS::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["jfqd"]
  s.email       = ["jfqd@blun.org"]
  s.homepage    = "https://github.com/jfqd/cps-client"
  s.summary     = %q{ruby api for the arp-client of cps-datensysteme.de}
  s.description = %q{ruby api for the arp-client of cps-datensysteme.de}

  s.add_dependency('always_verify_ssl_certificates', '>= 0.2.0')

  s.rubyforge_project = "cps-client"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
