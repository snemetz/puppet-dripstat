#
# Smoke Test
#

dripstat::application_monitoring { 'app monitoring':
  dripstat_version      => '3.5.0',
  dripstat_app_root_dir => '/opt/appserver'
}
