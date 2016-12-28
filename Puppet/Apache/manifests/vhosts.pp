class apache::vhosts {

  if $::osfamily == 'RedHat' {
    file { '/etc/httpd/conf.d/vhost.conf':
      ensure    => file,
      content   => template('apache/vhosts-rb.conf.erb'),
    }
    file {"/var/www/$servername":
      ensure    => directory,
    }
    file {"/var/www/$servername/public_html":
      ensure    => directory,
    }
    file {"/var/www/$servername/log":
      ensure    => directory,
    }

  } elsif $::osfamily == 'Debian' {
    file { "/etc/apache2/sites-available/$servername.conf":
       ensure  => file,
       content  => template('apache/vhosts-deb.conf.erb'),
    }
    file {"/var/www/$server":
       ensure  => directory,
    }
    file {"/var/www/html/$servername/public_html":
       ensure  => directory,
    }
    file {"/var/www/html/$servername/logs":
       ensure  => directory,
    }
    

  } else {
    print "Not supported"
  }
}
