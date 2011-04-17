require 'bundler'
require 'rake/testtask'
Bundler::GemHelper.install_tasks

task :default => :test
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.ruby_opts << '-rubygems'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end
