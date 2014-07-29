Master
[![Build Status](https://travis-ci.org/snemetz/puppet-dripstat.svg)](https://travis-ci.org/snemetz/puppet-dripstat)
[![Coverage Status](https://coveralls.io/repos/snemetz/puppet-dripstat/badge.png)](https://coveralls.io/r/snemetz/puppet-dripstat)
[![Dependency Status](https://gemnasium.com/snemetz/puppet-dripstat.svg)](http://gemnasium.com/snemetz/puppet-dripstat#development-dependencies)
[![Repo Size](https://reposs.herokuapp.com/?path=snemetz/puppet-dripstat)]()

puppet-dripstat
===============

This module can install DripStat's monitor agent on your servers. <br />
[DripStat](http://dripstat.com)<br />

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
 
## Installation

1. Sign up for an account at http://dripstat.com/signup.html if you haven't yet.
2. Apply the `dripstat` class to any nodes you want the agent installed on
3. Login to your DripStat dashboard and you should see your servers show up in a few minutes.

## Usage

```
  TODO: Add remove

  dripstat::application_monitoring { 'dripstat application monitoring for appserver':
    dripstat_version         => '3.5.0',
    dripstat_app_root_dir    => '/opt/appserver',
    dripstat_app_owner       => '<your app user>',
    dripstat_app_group       => '<your app group>',
    dripstat_license_key     => '<your license key>',
    dripstat_app_name        => '<your app name>',
    dripstat_agent_loglevel  => '<loglevel>',
    dripstat_agent_auditmode => true|false,
    dripstat_use_ssl         => true|false,
  }
```


