require 'rubygems'
require 'rbconfig'

Gem::Specification.new do |gem|
  gem.name       = 'linux-kstat'
  gem.version    = '0.1.3'
  gem.license    = 'Artistic 2.0'
  gem.author     = 'Daniel J. Berger'
  gem.email      = 'djberg96@gmail.com'
  gem.platform   = Gem::Platform.new('universal-linux')
  gem.homepage   = 'https://github.com/djberg96/linux-kstat'
  gem.summary    = 'Ruby interface for Linux kernel stats in /proc/stat'
  gem.test_files = Dir['test/test*']
  gem.files      = Dir['**/*'].reject{ |f| f.include?('git') }

  gem.extra_rdoc_files  = ['README', 'CHANGES', 'MANIFEST']

  gem.add_development_dependency('test-unit', '>= 2.5.0')

  gem.description = <<-EOF
    The linux-kstat library provides a hash style interface for reading
    Linux kernel statistics read out of /proc/stat.
  EOF
end
