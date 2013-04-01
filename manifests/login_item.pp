# Public: sets up KeyRemap4MacBook to launch on login
#
# Will add a login item and launch the application.
#
# Usage:
#
#   include keyremap4macbook::login_item
#
# or to remove login-item:
#
#   class { 'keyremap4macbook::login_item':
#     ensure => 'absent'
#   }
#
# Parameters:
#
#   ensure - 'present' or 'absent'. Defaults to 'present'.
class keyremap4macbook::login_item(
  $ensure = 'present'
) {
  include keyremap4macbook::config

  osx_login_item { 'KeyRemap4MacBook':
    ensure  => $ensure,
    path    => $keyremap4macbook::config::app,
    require => Package['KeyRemap4MacBook']
  }

  exec { 'launch keyremap4macbook':
    command     => "/usr/bin/open ${keyremap4macbook::config::app}",
    refreshonly => true,
    subscribe   => Package['KeyRemap4MacBook'],
    require     => Osx_login_item['KeyRemap4MacBook']
  }
}

