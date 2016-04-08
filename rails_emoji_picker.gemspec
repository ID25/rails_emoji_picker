# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_emoji_picker/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_emoji_picker'
  spec.version       = RailsEmojiPicker::VERSION
  spec.authors       = ['ID25']
  spec.email         = ['xid25x@gmail.com']

  spec.summary       = 'Simple Emoji picker for your app'
  spec.description   = 'Simple Emoji picker for your app'
  spec.homepage      = 'https://github.com/ID25/rails_emoji_picker'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'emoji'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'byebug'
end
