# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bluevia_engine/version"

Gem::Specification.new do |s|
  s.name        = "bluevia_engine"
  s.version     = BlueviaEngine::VERSION
  s.authors     = ["juandebravo"]
  s.email       = ["juandebravo@gmail.com"]
  s.homepage    = "https://github.com/juandebravo/bluevia_engine"
  s.summary     = %q{Rails Engine to provide BlueVia oAuth mechanism in a seamless way}
  s.description = %q{Rails Engine to provide BlueVia oAuth mechanism in a seamless way}

  s.rubyforge_project = "bluevia_engine"

  s.files         = `git ls-files`.split("\n")
  s.files.delete(".gitignore")
  s.files.delete(".rspec")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("oauth")
  
  s.add_development_dependency("webmock")
  
end
