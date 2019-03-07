# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nginx::service
class nginx::service {
  # create service
  service { 'nginx':
    ensure     => $nginx::service_ensure,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
