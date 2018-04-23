# ntp
#
# Installs, configures, and ensures ntp client is running
#

class ntp {
    # install the default npt package in our counfigured repo
    package {'ntp':
        ensure => present,
    }


    # these variables are used to compose the ntp.conf via
    # ntp/templates/etc_ntp.conf.erb
    $ntp_server_a = '127.127.1.0'
    $ntp_server_b = '0.rhel.pool.ntp.org iburst'

    # deploy ntp config, restart service if it changes
    file {'/etc/ntp.conf':
        ensure => file,
        mode   => '0644',
        owner  => 'root',
        group  => 'root',
        content => template('ntp/etc_ntp.conf.erb'),
        notify => Service['ntpd'],
    }

    # make sure service is running
    service {'ntpd':
        ensure => running,
        enable => true,
    }
}
