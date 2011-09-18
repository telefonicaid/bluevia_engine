require "bundler/gem_tasks"

require 'rake/rdoctask'

task :default => [:rdoc]

RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.title = "Rails Engine for BlueVia OAuth authentication"

  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('LICENSE.txt')
  
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.options << '-c' << 'utf-8'
  rdoc.options << '-g'
  rdoc.options << '-m' << 'README.rdoc'
  
end

