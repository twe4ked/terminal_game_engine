# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'terminal_game_engine/version'

Gem::Specification.new do |spec|
  spec.name = 'terminal_game_engine'
  spec.version = TerminalGameEngine::VERSION
  spec.authors = ['Odin Dutton']
  spec.email = ['odindutton@gmail.com']

  spec.summary = 'Terminal Game Engine'
  spec.homepage = 'https://github.com/twe4ked/terminal_game_engine'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
