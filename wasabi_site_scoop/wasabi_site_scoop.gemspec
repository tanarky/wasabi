$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wasabi_site_scoop/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wasabi_site_scoop"
  s.version     = WasabiSiteScoop::VERSION
  s.authors     = ["Satoshi Tanaka"]
  s.email       = ["tanarky@gmail.com"]
  s.homepage    = "http://example.com"
  s.summary     = "Summary of WasabiSiteScoop."
  s.description = "Description of WasabiSiteScoop."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
