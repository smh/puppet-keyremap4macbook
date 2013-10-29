# Public: Installs KeyRemap4MacBook 8.3.0
#
# Usage:
#
#   include keyremap4macbook
#
# Parameters:
#
#   launch_on_login - will automatically launch and login. Defaults to
#                     true. Set this to false if you want to avoid
#                     automatically launching.
class keyremap4macbook {
  include keyremap4macbook::config

  package { "KeyRemap4MacBook_${keyremap4macbook::config::version}":
    ensure   => installed,
    source   => $keyremap4macbook::config::dmg_url,
    provider => 'pkgdmg'
  }
}
