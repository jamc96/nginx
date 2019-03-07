# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nginx::install
class nginx::install {
  # install package
  package { 'nginx':
    ensure   => $nginx::package_ensure,
    provider => 'yum',
  }
}
