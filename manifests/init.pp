# Public: Installs KeyRemap4MacBook 8.0.0
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
  $app = '/Applications/KeyRemap4MacBook.app'

  package { 'KeyRemap4MacBook':
    ensure   => installed,
    source   => 'http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-8.0.0.dmg',
    provider => 'pkgdmg'
  }
}
