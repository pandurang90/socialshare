# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'socialshare/version'

Gem::Specification.new do |gem|
  gem.name          = "socialshare"
  gem.version       = Socialshare::VERSION
  gem.authors       = ["pandurang"]
  gem.email         = ["pandurang.plw@gmail.com"]
  gem.description   = %q{This gem allows text/messages to be shared on social networking sites (twitter,facebook,linkedin)}
  gem.summary       = %q{This gem allows text/messages to be shared on social networking sites (twitter,facebook,linkedin)}
  gem.homepage      = "https://github.com/pandurang90/socialshare"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

end
