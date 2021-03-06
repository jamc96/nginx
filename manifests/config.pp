# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nginx::config
class nginx::config {
  # defaults
  File {
    ensure => $nginx::config_ensure,
    owner  => 'nginx',
    group  => 'nginx',
    selinux_ignore_defaults => true,
  }
  # create directories
  file { $nginx::config_dir_path: ensure => directory }
  file { $nginx::log_dir_path:
    ensure => directory,
    mode   => $nginx::log_dir_mode,
  }
  exec { 'logs permissions':
    command     => "chown -R nginx:nginx ${$nginx::log_dir_path}",
    path        => ['/usr/bin', '/usr/sbin'],
    refreshonly => true,
    subscribe   => File[$nginx::log_dir_path],
  }
  # create config files
  file { $nginx::config_file_path:
    notify  => Service['nginx'],
    require => File[$nginx::config_dir_path],
  }
}
