# Create an entry in the pound config
define pound::entry (
    $listen_ip,
    $listen_port,
    $listen_protocol,
    $ssl_cert,
    $head_require=undef,
    $backend_ip,
    $backend_port) {


    concat::fragment {
        "pound_entry-${name}" :
            target => '/etc/pound/pound.cfg',
            content => template('pound/entry.cfg.erb'),
            order => 30,
            notify  => Service['pound'],
    }
}
