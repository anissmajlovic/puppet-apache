# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class apache (
  String $install_name,
  String $install_ensure,
  String $config_ensure,
  String $config_path,
  Enum["running","stopped"] $service_ensure,
  String $service_name,
  Boolean $service_enable,
  String $vhosts_dir,
  String $vhosts_owner,
  String $vhosts_group,
){
  contain apache::install
  contain apache::config
  contain apache::service

  Class['::apache::install']
  -> Class['::apache::config']
  ~> Class['::apache::service']
}
