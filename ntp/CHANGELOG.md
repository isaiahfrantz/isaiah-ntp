# Changelog

All notable changes to this project will be documented in this file.

## Release 0.1.0
04/22/2018 Initial implimentation
## Release 0.1.1
04/22/2018 moved static ntp.conf to a template to support dynamic config values
## Release 0.1.2
04/22/2018 added hiera lookups to set ntp servers based on host location
*NOTE* Currently using the prod heira.yaml config & data, may want to define some test specific data in teh future

**Features**
 * install current version of ntp package in configured repo
 * deploy config file, restart service if it changes
 * start service, ensure it starts at boot

**Bugfixes**
None at this time

**Known Issues**
N/A