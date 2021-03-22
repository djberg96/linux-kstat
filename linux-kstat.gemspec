require 'rubygems'

Gem::Specification.new do |gem|
  gem.name       = 'linux-kstat'
  gem.version    = '0.2.6'
  gem.license    = 'Apache-2.0'
  gem.author     = 'Daniel J. Berger'
  gem.email      = 'djberg96@gmail.com'
  gem.platform   = Gem::Platform.new('universal-linux')
  gem.homepage   = 'https://github.com/djberg96/linux-kstat'
  gem.summary    = 'Ruby interface for Linux kernel stats in /proc/stat'
  gem.test_files = Dir['spec/*_spec.rb']
  gem.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  gem.cert_chain = ['certs/djberg96_pub.pem']

  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec', '~> 3.9')

  gem.metadata = {
    'homepage_uri'      => 'https://github.com/djberg96/linux-kstat',
    'bug_tracker_uri'   => 'https://github.com/djberg96/linux-kstat/issues',
    'changelog_uri'     => 'https://github.com/djberg96/linux-kstat/blob/master/CHANGES.md',
    'documentation_uri' => 'https://github.com/djberg96/linux-kstat/wiki',
    'source_code_uri'   => 'https://github.com/djberg96/linux-kstat',
    'wiki_uri'          => 'https://github.com/djberg96/linux-kstat/wiki'
  }

  gem.description = <<-EOF
    The linux-kstat library provides a hash style interface for reading
    Linux kernel statistics read out of /proc/stat.
  EOF
end
