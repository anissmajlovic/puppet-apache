# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
#
# @example
# apache::vhosts { 'namevar':
#   port      => INT,
#   subdomain => STR,
#   admin     => STR,
#   docroot   => STR,
class apache (
  String $install_name,
  String $install_ensure,
  String $config_ensure,
  String $config_path,
  Enum['Running','Stopped'] $service_ensure,
  String $service_name,
  Boolean $service_enable,
  String $vhosts_dir,
  String $vhosts_owner,
  String $vhosts_group,
){
  contain apache::install
  contain apache::config
  contain apache::service

  apache::vhosts { 'puppet-project':
    port      => 80,
    subdomain => 'puppetproject',
    admin     => 'admin@localhost',
    docroot   => '/var/www/html/puppetproject'
  }
  apache::vhosts { 'awesome-project':
    port      => 80,
    subdomain => 'awesomeproject',
    admin     => '',
    docroot   => '/var/www/html/awesomeproject'
  }

  Class['::apache::install']
  -> Class['::apache::config']
  ~> Class['::apache::service']
}
