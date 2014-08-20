source 'http://rubygems.org'

group :test do
  gem 'rake', '~> 10.3.1'
  gem 'puppet', ENV['PUPPET_VERSION'] || '~> 3.6.2'
  gem 'puppet-syntax', '~> 1.3.0'
  gem 'puppet-lint', '~> 1.0.0'
  gem 'rspec', '~> 2.14.1'
  # For use with travis
  gem 'rspec-puppet', '~> 1.0.1'
  # For use locally. Doesn't work with travis
  #gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'
  #gem 'rspec-puppet', '>= 1.0.1', :github => 'rodjek/rspec-puppet'
  gem 'puppetlabs_spec_helper', '~> 0.8.0'
  gem 'coveralls', :require => false
  #gem 'codeclimate-test-reporter', :require => nil
end
