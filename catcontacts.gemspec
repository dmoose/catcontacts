$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "catcontacts/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "catcontacts"
  s.version     = Catcontacts::VERSION
  s.authors     = ["Jeff Shumate"]
  s.email       = ["jeff@example.com"]
  s.homepage    = "http://example.com"
  s.summary     = "Summary of Catcontacts."
  s.description = "Description of Catcontacts."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "geocoder", "~> 1.3.4"
  s.add_dependency "smarter_csv", "~> 1.1.0"
  s.add_dependency "phonelib"

end
