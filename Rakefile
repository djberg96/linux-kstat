require 'rake'
require 'rake/clean'
require 'rspec/core/rake_task'

CLEAN.include('**/*.gem', '**/*.rbc')

namespace :gem do
  desc 'Build the linux-kstat gem'
  task :create => [:clean] do
    spec = eval(IO.read('linux-kstat.gemspec'))
    require 'rubygems/package'
    Gem::Package.build(spec, true)
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

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = ['spec/*.rb']
end

task :default => :spec
