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
    
    # All hosts use the same primary ntp server 
    $ntp_server_a = lookup('ntp::server::common')

    # Hosts use a secondary ntp server based on the data center they are located in
    $this_nodes_dc = lookup($facts['hostname'])
    $ntp_server_b = lookup("ntp::server::dc${this_nodes_dc}")


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
