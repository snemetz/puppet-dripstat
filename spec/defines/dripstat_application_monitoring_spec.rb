#  #!/usr/bin/env rspec

require 'spec_helper'

describe 'dripstat::application_monitoring' do
  let (:title) { 'dripstat application monitoring' }

#  context 'without a version specified' do
#    it {
##      should_not run.and_raise_error (
#       expect { subject }.to raise_error(
#        Puppet::ParseError
#    )}
##        Puppet::Error, /The version of the DripStat agent must be provided/
#  end

#  context 'without an installation root directory specified' do
#    let (:params) { { :dripstat_version => '3.5.0' } }
#    it {
#      expect { subject }.to raise_error(
#        Puppet::Error, /The root directory of the application server installation must be provided/
#    )}
#  end

#  context 'without a license_key specified' do
#    let (:params) { { :dripstat_version => '3.5.0', :dripstat_app_root_dir => '/opt/appserver' } }
#    it {
#      expect { subject }.to raise_error(
#      	Puppet::Error, /The license key associated with your DripStat account must be provided/
#    )}
#  end

#  context 'without a valid agent loglevel' do
#    let (:params) { { :dripstat_version        => '3.5.0',
#                      :dripstat_app_root_dir   => '/opt/appserver',
#                      :dripstat_license_key    => '1234567890' ,
#                      :dripstat_agent_loglevel => 'vverbosedebug'} }
#    it {
#    	expect { subject }.to raise_error(
#      	Puppet::Error, /vverbosedebug is not one of valid predefined values for agent loglevels/
#    )}
#  end

#  context 'without a valid use_ssl value' do
#    let (:params) { { :dripstat_version        => '3.5.0',
#                      :dripstat_app_root_dir   => '/opt/appserver',
#                      :dripstat_license_key    => '1234567890' ,
#                      :dripstat_agent_loglevel => 'info',
#                      :dripstat_use_ssl        => 'bla'} }
#
#    it {
#      expect { subject }.to raise_error(
#        Puppet::Error, /parameter dripstat_use_ssl must be a boolean/
#    )}
#  end

  context 'with a valid version, installation directory and license_key' do
    let (:params) { { :dripstat_version      => '3.5.0',
                      :dripstat_app_root_dir => '/opt/appserver',
                      :dripstat_license_key  => '1234567890' } }

    it { should contain_file('/opt/appserver/dripstat') }
    it { should contain_file('/opt/appserver/dripstat/dripstat.jar') }
    it { should contain_file('/opt/appserver/dripstat/config.properties') }
  end

  context 'with a valid version, installation directory, application owner and group, license_key and agent loglevel' do
    let (:params) { { :dripstat_version        => '3.5.0',
                      :dripstat_app_root_dir   => '/opt/appserver',
                      :dripstat_app_owner      => 'dripstat',
                      :dripstat_app_group      => 'dripstat',
                      :dripstat_license_key    => '1234567890',
                      :dripstat_agent_loglevel => 'info' } }

    it do
    	should contain_file('/opt/appserver/dripstat').with({
      	'ensure' => 'directory',
      	'owner'  => 'dripstat',
      	'group'  => 'dripstat',
    	})
    end
    it do
    	should contain_file('/opt/appserver/dripstat/logs').with({
      	'ensure' => 'directory',
      	'owner'  => 'dripstat',
      	'group'  => 'dripstat',
    	})
    end
    it do
      should contain_file('/opt/appserver/dripstat/dripstat.jar').with({
        'ensure' => 'file',
        'owner'  => 'dripstat',
        'group'  => 'dripstat',
      })
    end
    it do
      should contain_file('/opt/appserver/dripstat/config.properties').with({
        'ensure' => 'file',
        'owner'  => 'dripstat',
        'group'  => 'dripstat',
      })
    end
  end
  # TODO: Add Tests
end
