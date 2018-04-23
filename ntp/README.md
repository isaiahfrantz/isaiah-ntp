
# ntp

Puppet module to manage ntp service and config on an RHEL system


#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with ntp](#setup)
    * [Beginning with ntp](#beginning-with-ntp)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

Install, configure, and run ntp client on a RHEL 5|6 host

## Setup

### Beginning with ntp

To use this module, ensure that the variables defined in the module and the format of templates/etc_ntp.conf.erb are correct for your hosts

## Usage

Either do a `puppet apply init.pp` directly on a host or add this module to your puppetserver in a role that will be applied to this host

## Limitations

This module is intended, and test on, RHEL|CentOS 5.x & 6.x only, other os families will cause failures

## Development

If you see any issues or think of an improvement, please submit a pull request with a detailed description of your changes and we can discus its inclusion after I evaluate it.
Thanks!
