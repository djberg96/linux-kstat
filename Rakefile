require 'rake'
require 'rake/clean'
require 'rake/testtask'

CLEAN.include('**/*.gem', '**/*.rbc')

namespace :gem do
  desc 'Build the linux-kstat gem'
  task :create => [:clean] do
    spec = eval(IO.read('linux-kstat.gemspec'))
    Gem::Builder.new(spec).build
  end

  desc "Install the linux-kstat gem"
  task :install => [:create] do
    file = Dir["*.gem"].first
    sh "gem install #{file}"
  end
end

Rake::TestTask.new do |t|
  task :test => :clean
  t.warning = true
  t.verbose = true
end

task :default => :test
