require 'rubygems'
require 'bundler/setup'
require 'rspec/core/rake_task'
require 'kitchen/rake_tasks'
require 'stove/rake_task'

RSpec::Core::RakeTask.new(:chefspec)
Stove::RakeTask.new

task :test => :chefspec
