# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'axe/version'

Gem::Specification.new do |s|
  s.name        = 'axe'
  s.version     = Axe::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['John Thomas Marino']
  s.email       = 'writejm@gmail.com'
  s.homepage    = 'http://github.com/johmas/axe'
  s.summary     = 'axe makes parsing logs easy as you develop'
  s.description = %q{
    axe is a command line utility that makes parsing logs easy as you develop.
  }
  s.rubyforge_project = 'axe'
  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob('lib/**/*')
  s.files            += Dir.glob('bin/**/*')
  s.files            += Dir.glob('test/**/*')
  s.require_paths     = ['lib']
  s.executables       = %w( axe )
end
