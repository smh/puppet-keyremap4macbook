# Public: Installs KeyRemap4MacBook 8.0.0
#
# Usage:
#
#   include keyremap4macbook

class keyremap4macbook {
  package { 'KeyRemap4MacBook':
    ensure   => installed,
    source   => 'http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-8.0.0.dmg',
    provider => 'pkgdmg'
  }
}
