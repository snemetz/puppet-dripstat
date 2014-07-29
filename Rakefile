
require 'rubygems'
require 'rake'
require 'puppet-syntax/tasks/puppet-syntax'
require 'puppet-lint/tasks/puppet-lint'
require 'puppetlabs_spec_helper/rake_tasks'

exclude_paths = [
  "pkg/**/*",
  "spec/**/*",
]
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_variable_scope')
PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

desc "Run syntax, lint, and spec tests."
task :test => [
  :syntax,
  # Create files in tasks for language syntax, then run all of them
#  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
#    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
#  end
#  Dir['templates/**/*.erb'].each do |template|
#    sh "erb -P -x -T '-' #{template} | ruby -c"
#  end
  :lint,
  :spec,
]

# If run on own CI server
#task_dir = File.expand_path("../tasks", __FILE__)
#
#FileList["#{task_dir}/**/*.rake"].each { |fn| load fn }
#
#desc "Default task prints the available targets."
#task :default do
#  sh %{rake -T}
#end
