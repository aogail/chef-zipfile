require 'rubygems'
require 'bundler/setup'
require 'rspec/core/rake_task'
require 'kitchen/rake_tasks'
require 'stove/rake_task'
require 'rake/packagetask'

RSpec::Core::RakeTask.new(:chefspec)
Kitchen::RakeTasks.new
Stove::RakeTask.new

Rake::PackageTask.new('to_extract', :noversion) do |p|
  p.need_zip = true
  p.package_files.include 'test/**/extract_spec.rb'
end

task 'kitchen:all' => 'package'
task 'kitchen:extract-centos' => 'package'
task :test => [:chefspec, 'kitchen:all']
