require 'rubygems'
require 'rbconfig'

Gem::Specification.new do |gem|
  gem.name       = 'linux-kstat'
  gem.version    = '0.1.0'
  gem.license    = 'Artistic 2.0'
  gem.author     = 'Daniel J. Berger'
  gem.email      = 'djberg96@gmail.com'
  gem.homepage   = 'http://www.rubyforge.org/projects/shards'
  gem.summary    = 'Ruby interface for Linux kernel stats in /proc/stat'
  gem.test_files = Dir['test/test*']
  gem.has_rdoc   = true
  gem.files      = Dir['**/*'].reject{ |f| f.include?('git') }

  gem.rubyforge_project = 'shards'
  gem.extra_rdoc_files  = ['README', 'CHANGES', 'MANIFEST']

  gem.description = <<-EOF
    The linux-kstat library provides a hash style interface for reading
    Linux kernel statistics read out of /proc/stat.
  EOF

  gem.add_development_dependency('test-unit', '>= 2.1.2')
end
