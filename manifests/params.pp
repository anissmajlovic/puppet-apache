# @summary Setting up OS related variables
#

class apache::params {
  $install_ensure = 'present'
  case $::osfamily {
    'RedHat': {
      $install_name = 'httpd'
    }
    'Debian': {
      $install_name = 'apache2'
    }
  }
}
