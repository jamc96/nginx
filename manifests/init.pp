# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nginx
class nginx(
  Enum['present', 'absent'] $package_ensure = 'present',
  Enum['present', 'absent'] $config_ensure = 'present',
  String $condi_dir_path = '/etc/nginx',
  String $config_file_path = '/etc/nginx/nginx.conf',
  String $log_dir_path = '/var/log/nginx',
  Enum['running', 'stopped'] $service_ensure = 'running',
) {
  # class containment
  include ::nginx::install
  include ::nginx::config
  include ::nginx::service
}
