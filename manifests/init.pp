#
# vsftpd module
#
# Copyright 2011, Atizo AG
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class vsftpd {
  package{'vsftpd':
    ensure => installed,
  }
  service{'vsftpd':
    ensure => running,
    enable => true,
    hasstatus => true,
    require => File['/etc/vsftpd/vsftpd.conf'],
  }
  file{'/etc/vsftpd/vsftpd.conf':
    source => [
      "puppet://$source/modules/site-vsftpd/vsftpd.conf",
      "puppet://$source/modules/vsftpd/vsftpd.conf",
    ],
    require => Package['vsftpd'],
    owner => root, group => root, mode => 0600,
  }
}
