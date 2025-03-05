require 'rubygems'

Gem::Specification.new do |gem|
  gem.name       = 'linux-kstat'
  gem.version    = '0.2.7'
  gem.license    = 'Apache-2.0'
  gem.author     = 'Daniel J. Berger'
  gem.email      = 'djberg96@gmail.com'
  gem.homepage   = 'https://github.com/djberg96/linux-kstat'
  gem.summary    = 'Ruby interface for Linux kernel stats in /proc/stat'
  gem.test_files = Dir['spec/*_spec.rb']
  gem.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  gem.cert_chain = ['certs/djberg96_pub.pem']

  gem.add_development_dependency('rake')
  gem.add_development_dependency('rubocop')
  gem.add_development_dependency('rubocop-rspec')
  gem.add_development_dependency('rspec', '~> 3.9')

  # Don't build this gem with Java-based implementations
  if RUBY_ENGINE !~ /truffleruby|jruby/i
    gem.platform = Gem::Platform.new(['universal', 'linux'])
  end

  gem.metadata = {
    'homepage_uri'          => 'https://github.com/djberg96/linux-kstat',
    'bug_tracker_uri'       => 'https://github.com/djberg96/linux-kstat/issues',
    'changelog_uri'         => 'https://github.com/djberg96/linux-kstat/blob/master/CHANGES.md',
    'documentation_uri'     => 'https://github.com/djberg96/linux-kstat/wiki',
    'source_code_uri'       => 'https://github.com/djberg96/linux-kstat',
    'wiki_uri'              => 'https://github.com/djberg96/linux-kstat/wiki',
    'rubygems_mfa_required' => 'true',
    'github_repo'           => 'https://github.com/djberg96/linux-kstat',
    'funding_uri'           => 'https://github.com/sponsors/djberg96'
  }

  gem.description = <<-EOF
    The linux-kstat library provides a hash style interface for reading
    Linux kernel statistics read out of /proc/stat.
  EOF
end
