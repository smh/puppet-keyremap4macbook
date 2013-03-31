# Public: sets up KeyRemap4MacBook to launch on login
#
# Will add a login item and launch the application.
#
# Usage:
#
#   keyremap4macbook::launch_on_login
#
# Parameters:
#
#   ensure - 'present' or 'absent'. Defaults to 'present'.
define keyremap4macbook::launch_on_login(
  $ensure = 'present'
) {
  include keyremap4macbook

  osx_login_item { 'KeyRemap4MacBook':
    ensure  => $ensure,
    path    => $keyremap4macbook::app,
    require => Package['KeyRemap4MacBook']
  }

  exec { 'launch keyremap4macbook':
    command     => "/usr/bin/open ${keyremap4macbook::app}",
    refreshonly => true,
    subscribe   => Package['KeyRemap4MacBook'],
    require     => Osx_login_item['KeyRemap4MacBook']
  }
}

