# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nginx
class nginx(
  Enum['present', 'absent'] $package_ensure,
  Enum['present', 'absent'] $config_ensure,
  String $config_dir_path,
  String $config_file_path,
  String $log_dir_path,
  String $log_dir_mode,
  Enum['running', 'stopped'] $service_ensure,
) {
  # class containment
  include ::nginx::install
  include ::nginx::config
  include ::nginx::service
}
