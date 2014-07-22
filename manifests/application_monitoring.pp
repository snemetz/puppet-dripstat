# Define: dripstat::application_monitoring
#
# This defined type manages the installation of dripstat::application_monitoring
#
# Parameters:
#
# [*dripstat_version*] The version of the DripStat agent (no default).
# - Required: yes
# - Content: String
#
# [*dripstat_app_root_dir*] The DripStat agent installation directory (no default).
# - Required: yes
# - Content: String
#
# [*dripstat_app_owner*] The owner of the DripStat agent installation directory (default: 'root').
# - Required: yes
# - Content: String
#
# [*dripstat_app_group*] The group of the DripStat agent installation directory (default: 'root').
# - Required: yes
# - Content: String
#
# [*dripstat_license_key*] 40-character hexadecimal string provided by DripStat. This is required in order for the server monitor to start (no default).
# - Required: yes
# - Content: String
#
# [*dripstat_app_name*] Set the name of your application as you'd like it show up in DripStat (default: 'My Application').
# - Required: yes
# - Content: String
#
# [*dripstat_agent_loglevel*] The agent uses its own log file to keep its logging separate from that of your application (default: 'info').
# - Required: no
# - Content: 'off' | 'severe' | 'warning' | 'info' | 'fine' | 'finer' | 'finest'
#
# [*dripstat_use_ssl*] The agent communicates with DripStat via http by default.  If you want to communicate via https to increase security,
#                      then turn on SSL by setting this value to true (default: false).
# - Required: no
# - Content: true | false
#
# [*dripstat_record_sql*] When transaction tracer is on, SQL statements can optionally be recorded. The recorder has three modes, "off" which sends no
#                         SQL, "raw" which sends the SQL statement in its original form, and "obfuscated", which strips out numeric and string literals.
#                         (default: obfuscated).
# - Required: no
# - Content: 'obfuscated' | 'raw' | 'off'
#
# Sample Usage:
#
# dripstat::application_monitoring { 'dripstat application monitoring':
#   dripstat_version        => '2.18.0',
#   dripstat_app_root_dir   => '/opt/appserver',
#   dripstat_app_owner       => '<your app user>',
#   dripstat_app_group      => '<your app group>',
#   dripstat_license_key     => '<your license key>',
#   dripstat_app_name        => '<your app name>',
#   dripstat_agent_loglevel  => '<loglevel>',
#   dripstat_agent_auditmode => false,
#   dripstat_use_ssl         => true,
# }
#
define dripstat::application_monitoring(
  $dripstat_version=undef,
  $dripstat_app_root_dir=undef,
  $dripstat_app_owner='root',
  $dripstat_app_group='root',
  $dripstat_license_key=undef,
  $dripstat_app_name='My Application',
  $dripstat_agent_loglevel='info',
  $dripstat_agent_auditmode=false,
  $dripstat_use_ssl=true
) {

  if $dripstat_version == undef {
    fail('The version of the DripStat agent must be provided')
  }

  if $dripstat_app_root_dir == undef {
    fail('The root directory of the application server installation must be provided')
  }

  if $dripstat_license_key == undef {
    fail('The license key associated with your DripStat account must be provided')
  }

  if ! ($dripstat_agent_loglevel in ['off' , 'trace' , 'info' , 'warn' , 'error' , 'fatal']) {
    fail("${dripstat_agent_loglevel} is not one of valid predefined values for agent loglevels")
  }

  case $dripstat_use_ssl {
    true, false: { $dripstat_use_ssl_real = $dripstat_use_ssl }
    default: {
      fail("Newrelic::Application_monitoring[${dripstat_use_ssl}]: parameter dripstat_use_ssl must be a boolean")
    }
  }

  file { "${dripstat_app_root_dir}/dripstat" :
    ensure => directory,
    owner  => $dripstat_app_owner,
    group  => $dripstat_app_group,
  }

  file { "${dripstat_app_root_dir}/dripstat/logs" :
    ensure  => directory,
    owner   => $dripstat_app_owner,
    group   => $dripstat_app_group,
    require => File["${dripstat_app_root_dir}/dripstat"],
  }

  file { "${dripstat_app_root_dir}/dripstat/dripstat.jar" :
    ensure  => file,
    owner   => $dripstat_app_owner,
    group   => $dripstat_app_group,
    source  => "puppet:///modules/${module_name}/dripstat_agent-${dripstat_version}/dripstat.jar",
    require => File["${dripstat_app_root_dir}/dripstat"],
  }

  file { "${dripstat_app_root_dir}/dripstat/config.properties" :
    ensure  => file,
    owner   => $dripstat_app_owner,
    group   => $dripstat_app_group,
    content => template("${module_name}/config.properties.erb"),
  }

}
