# ntp
#
# Installs, configures, and ensures ntp client is running
#

class ntp {
    # install the default npt package in our counfigured repo
    package {'ntp':
        ensure => present,
    }

    # deploy ntp config, restart service if it changes
    file {'/etc/ntpd.conf':
        ensure => file,
        mode   => '0644',
        owner  => 'root',
        group  => 'root',
        source => 'puppet:///modules/ntp/etc_ntp.conf',
        notify => Service['ntpd'],
    }

    # make sure service is running
    service {'ntpd':
        ensure => running,
        enable => true,
    }
}
