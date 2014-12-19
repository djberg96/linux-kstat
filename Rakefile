require 'rake'
require 'rake/clean'
require 'rake/testtask'

CLEAN.include('**/*.gem', '**/*.rbc')

namespace :gem do
  desc 'Build the linux-kstat gem'
  task :create => [:clean] do
    spec = eval(IO.read('linux-kstat.gemspec'))
    if Gem::VERSION < "2.0"
      Gem::Builder.new(spec).build
    else
      require 'rubygems/package'
      Gem::Package.build(spec)
    end
  end

  desc "Install the linux-kstat gem"
  task :install => [:create] do
    file = Dir["*.gem"].first
    if RUBY_PLATFORM == 'java'
      sh "jruby -S gem install -l #{file}"
    else
      sh "gem install -l #{file}"
    end
  end
end

Rake::TestTask.new do |t|
  task :test => :clean
  t.warning = true
  t.verbose = true
end

task :default => :test
