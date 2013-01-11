# -*- encoding: utf-8 -*-
require File.expand_path('../lib/base64ize_image_tag/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["kkosuge"]
  gem.email         = ["root@kksg.net"]
  gem.description   = %q{replace src values in image_tag with data URI scheme}
  gem.summary       = %q{replace src values in image_tag with data URI scheme}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "base64ize_image_tag"
  gem.require_paths = ["lib"]
  gem.version       = Base64izeImageTag::VERSION

  gem.add_runtime_dependency "mime-types", "~> 1.19"
end
