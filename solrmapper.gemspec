# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "solrmapper/version"

Gem::Specification.new do |s|
  s.name        = "SolrMapper"
  s.version     = SolrMapper::VERSION
  s.authors     = ["Nick Zadrozny"]
  s.email       = ["nick@onemorecloud.com"]
  s.homepage    = "http://github.com/nz/solrmapper"
  s.summary     = %q{An ORM for Solr documents.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
