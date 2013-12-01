# Public: call the commandline
#
# command = the command to pass to the commandline. Defaults to the title.
#
# Examples
#
#   # set the repeat.wait parameter to 30
#   keyremap4macbook::exec { 'set repeat.wait 30': }
#
#   # explicitly specify the commandline
#   keyremap4macbook::exec { 'foobar':
#     commandline => 'enable remap.shiftL2commandL'
#   }
define keyremap4macbook::exec($command = $title, $unless = undef) {
  include keyremap4macbook::config

  exec { "keyremap4macbook::exec ${command}":
    command => "${keyremap4macbook::config::cli} ${command}",
    require => Exec['launch keyremap4macbook'],
    unless => $unless ? {
      undef => undef,
      default => "${keyremap4macbook::config::cli} changed | grep ${unless}"
    }
  }
}
