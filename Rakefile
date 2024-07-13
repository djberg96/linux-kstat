require 'rake'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

CLEAN.include('**/*.gem', '**/*.rbc', '**/*.lock')

namespace :gem do
  desc 'Build the linux-kstat gem'
  task :create => [:clean] do
    require 'rubygems/package'
    spec = Gem::Specification.load('linux-kstat.gemspec')
    spec.signing_key = File.join(Dir.home, '.ssh', 'gem-private_key.pem')
    Gem::Package.build(spec)
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

RuboCop::RakeTask.new

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = ['spec/*.rb']
end

# Clean up afterwards
Rake::Task[:spec].enhance do
  Rake::Task[:clean].invoke
end

task :default => :spec
