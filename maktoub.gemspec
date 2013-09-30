$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "maktoub/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "maktoub"
  s.version     = Maktoub::VERSION
  s.authors     = ["Zaid Zawaideh","Nada Aldahleh"]
  s.homepage    = "http://www.sandglaz.com"
  s.summary     = "A simple newsletter engine for rails."
  s.description = "A simple newsletter engine for rails."
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.1"
  s.add_dependency "premailer"
  s.add_dependency "nokogiri"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end

